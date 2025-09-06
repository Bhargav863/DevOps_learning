#!/bin/bash
# Patching automation script for Redis

AWX_TEMPLATE_URL="https://awx.corp.cox.com/api/v2/job_templates/1857/launch/"
AWX_BASE_URL="https://awx.corp.cox.com"
AWX_PATCH_JOB_TEMPLATE_ID="1857"
AWX_OAUTH_TOKEN=$1
ordered_nodes=() # An empty array to store nodes after ordered to patch master at last

# ======================Fetch node list and order it to get master at last===========================

get_ordered_node_list() {
# Declare arrays to store node numbers
slave_nodes=() # empty array to store slave nodes
master_node="" # variable to store the master node.

echo "Getting Redis Enterprise nodes from rladmin..."

# Fetch node list, skipping the header lines
NODES=$(cat nodes.txt | awk 'NR>2 && $1 ~ /node/ {print $1,$2,$4}')

# Parse the input from NODES and specify the master and slave

while read -r node_id role hostname;
do
  if [[ $role == "slave" ]]
  then
    slave_nodes+=($node_id:$hostname)
  elif [[ $role == "master" ]]
  then
    master_node=($node_id:$hostname)
  fi
done <<< $NODES

# Copy the slaves and master into the ordered_node

ordered_nodes=("${slave_nodes[@]}")
ordered_nodes+=(${master_node})

echo "ordered nodes are :"
for node in "${ordered_nodes[@]}"; do
    echo "  $node"
done
}

trigger_awx_job() {
    local target_host="$1"
     # curl request to trigger the AWX job
    response=$(curl -s \
        -H "Authorization: Bearer $AWX_TOKEN" \
        -H "Content-Type: application/json" \
        -d '{
      "extra_vars": {
        "target": ["'"$target_host"'"]
      },
      "limit": "'"$target_host"'"
    }' \
        -X POST "$AWX_BASE_URL/api/v2/job_templates/$AWX_PATCH_JOB_TEMPLATE_ID/launch/")

    job_id=$(echo "$response" | jq -r '.id')

    if [[ "$job_id" == "null" || -z "$job_id" ]]; then
        echo "Failed to trigger AWX job."
        exit 1
    fi

    echo "Job launched. Job ID: $job_id"
         
}

wait_for_awx_job() {
    local job_id=$1

    echo "Monitoring AWX job ID: $job_id..."

    while true; do
        response=$(curl -s \
            -H "Authorization: Bearer $AWX_TOKEN" \
            "$AWX_BASE_URL/api/v2/jobs/${job_id}" | jq -r '.status')

        status=$(echo "$json" | jq -r '.status')

        status=$(echo "$response" | jq -r '.status')
        echo "Current job status: $status"

        if [[ "$status" == "successful" ]]; then
            echo "AWX job completed successfully!"
            return 0
        elif [[ "$status" == "failed" || "$status" == "error" || "$status" == "canceled" ]]; then
            echo "AWX job failed or was canceled!"
            return 1
        fi

        sleep 300 # Check every 300 seconds
    done
}

validate(){
    if [[ $1 -ne 0 ]];
    then
       echo "... Failed"
    else
       echo -e "... success"
    fi
}


# --------------------- Main Execution ---------------------
# Call the ordered node list function
get_ordered_node_list

for nodes in "${ORDERED_NODES[@]}"; do
    node_id="${nodes%%:*}"     
    hostname="${nodes##*:}"
    echo "=========================================="
    echo " Patching node: $hostname (ID: $node_id)"
    echo "=========================================="

    echo "Putting node $node_id into maintenance mode..."
    rladmin node "$node_id" maintenance_mode on
    validate $? "turning on maintenance mode on node $node_id "

    if [[ $hostname == "server1" ]]; then
        awx_hostname="REDIS-PROD-NODE1"
    elif [[ $hostname == "server2" ]]; then
        awx_hostname="REDIS-PROD-NODE2"
    elif [[ $hostname == "server3" ]]; then
        awx_hostname="REDIS-PROD-NODE3"
    fi 
    
    echo " Launching AWX job for the host: $hostname"
    job_id=$(trigger_awx_job "$awx_hostname")
    
    echo " Wait for AWX job to complete"
    wait_for_awx_job $job_id

    echo "Disabling maintenance mode on node $node_id..."
    rladmin node "$node_id" maintenance_mode off
    validate $? "turning off maintenance mode on node $node_id"

    echo "Node $hostname patched and restored."
    echo
done


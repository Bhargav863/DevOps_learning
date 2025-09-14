Ansible tags provide a mechanism to selectively execute or skip specific tasks or sets of tasks within a playbook. This functionality is particularly useful in large or complex playbooks where you may only need to run a subset of the defined automation.

If you have a large playbook, it may be useful to run only specific parts of it instead of running the entire playbook. You can do this with Ansible tags. Using tags to execute or skip selected tasks is a two-step process:

 1) Add tags to your tasks, either individually or with tag inheritance from a block, play, role, or import
 2) Select or skip tags when you run your playbook.
    ```
    ansible-playbook -i <inventory_name> <playbook-name> --tags tag1,tag2..
    ```
    ```
    ansible-playbook -i <inventory-name> <playbook-name> --skip-tags tagname
    ```
 3) tagging a playbook example
    ```
    tasks:
        - name: Install the servers
        ansible.builtin.yum:
            name:
            - httpd
            - memcached
            state: present
        tags:
        - packages
        - webservers

        - name: Configure the service
        ansible.builtin.template:
            src: templates/src.j2
            dest: /etc/foo.conf
        tags:
        - configuration
    ```
Refer to catalouge.yaml, I have tagged all the tasks. we have some tasks that can be run only once during the server setup and there are few tasks to run frequently, monthly. Using tags i can ignore the non-repetive tasks.

```
ansible-playbook catalogue.yaml --tags deployment
```

 
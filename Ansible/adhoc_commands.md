These are simple linux commands which is used for temporary works. These commands are only for one time usage. These commands are not used for deployment and configuration management.
  1) This commands can be run individually to perform some simple non repeated tasks.
  2) Ansible ad-hoc commands uses /usr/bin/ansible command line tool to automate single task.
  3) Always execute commands from ansible user. 
     1) Run "ls" command to list files in the directory /home/ansible
        ansible all -i inventory -a ls --> lists all the files on all servers in the inventory
        ansible dev -i inventory -a ls --> lists all the files from dev servers in the inventory
        all --> picks all servers in the inventory
        dev --> Picks only the dev group servers in the inventory
        -a --> arguments
        ls --> command to be executed
        -i --> specifying the inventory file.
      2) Create a file named file1.txt on all remote hosts
         ansible all -i inventory -a "touch file1.txt"
      3) Run yum updated on all servers
         ansible all -i inventory -a "yum update -y" --> It will throw an error
         ```
             172.31.87.147 | FAILED | rc=1 >>
            Loaded plugins: extras_suggestions, langpacks, priorities, update-motdYou need to be root to perform this command.non-zero return code 
         ```
      4)  To over come the above error you need to be root user to perform the tasks.
          ansible all -i inventory -a -b "yum update -y"
          -b --> to become root user
       
  
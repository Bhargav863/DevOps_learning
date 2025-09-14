Ansible's behavior is controlled through various configuration settings, primarily managed through the ansible.cfg file. Understanding these settings and their precedence is crucial for effective Ansible use

Changes can be made and used in a configuration file which will be searched for in the following order:

 1) ANSIBLE_CONFIG (environment variable if set) If set, this variable points to the configuration file Ansible will use.

 2) ansible.cfg (in the current directory) If present in the directory where the Ansible command is executed.

 3) ~/.ansible.cfg (in the home directory) in the user's home directory: A user-specific configuration file.

 4) /etc/ansible/ansible.cfg The default system-wide configuration file.

ansible.cfg
```
[defaults]
inventory = /home/ansible/ram/inventory # Specifies the path to the inventory file.
remote_user = ansible
host_key_checking = false
private_key_file = /home/ansible/.ssh/id_rsa # path to private key
[privilege_escalation]
become = true
become_method = sudo
become_user = root
become_ask_pass = false
```

* ansible.cfg as a environment variable
```
export ANSIBLE_CONFIG=/home/ansible/DevOps_learning/Ansible/ansible.cfg
```
```
ansible-playbook configuration/demo.yaml
```
* keep the ansible.cfg inside the current working directory and check.
```
ansible-playbook demo.yaml
```
* check which configuration file is ansible taking by running below command.
```
ansible --version
```

```
ansible@Redis-node1:~/DevOps_learning/Ansible$ ansible --version
ansible 2.10.8
config file = /home/ansible/DevOps_learning/Ansible/ansible.cfg
configured module search path = ['/home/ansible/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
ansible python module location = /usr/lib/python3/dist-packages/ansible
executable location = /usr/bin/ansible
python version = 3.10.12 (main, May 27 2025, 17:12:29) [GCC 11.4.0]
```




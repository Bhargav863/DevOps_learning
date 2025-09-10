1) Ansible uses playbooks to define and execute automation tasks.
2) Playbooks in ansible are written in the YAML language.
3) YAML stands for yet another markup language.
4) A playbook is a YAML file that describes the series of steps or task that needs to be performed on remote servers.
5) You can write codes consists of vars ,tasks, files ,handlers, templates and roles.

     Variables(vars): - Allows you to define variables that can be used in playbooks during        automation.

     Tasks: - Specifies the actions or command that need to be run on remote hosts.

      Hosts:- Defines the target host where the tasks will be executed.

      Handlers: - Defines action to be taken when notified by other tasks.

      Roles: - Organize tasks, variables and other components into a reusable modules.

      Files and templates are components used for managing and manipulating files on remote target systems during automation tasks.

6) Each playbook is composed of one or more modules. A module is a collection of configuration files.
7) Playbooks are mainly divided into sections like

     1) Target section: - Defines hosts against which tasks are need to be executed.
     2) variable section:- Defines variables .
     3) Task section :- List of modules we need to run in order.

## ansible.cfg file is the primary configuration file for Ansible, used to customize various aspects of its behavior. It allows users to define settings and parameters that influence how Ansible operates, from connection details to privilege escalation and output formatting.

Ansible searches for ansible.cfg in a specific order:
 1) ANSIBLE_CONFIG environment variable (if set)
 2) ansible.cfg in the current working directory
 3) .ansible.cfg in the user's home directory
 4) /etc/ansible/ansible.cfg (global configuration)
Settings in higher-precedence files override those in lower-precedence ones.
        


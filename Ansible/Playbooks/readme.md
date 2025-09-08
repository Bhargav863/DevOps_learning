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
     Target section: - Defines hosts against which tasks are need to be executed.
     variable section:- Defines variables .
     Task section :- List of modules we need to run in order.


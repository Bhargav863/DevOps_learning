Ansible uses variables which are defined previously to enable more flexibility in playbooks and roles they can be used loop through a set of given values, access various information like hostname of a system and replace certain strings in templates with specific values.

1) shell --> ${var_name} or $var_name
2) Ansible --> {{ var_name }}, it should be always in double braces.

Different ways to specify variables in ansible
1) Define variables at play level.
2) Define variables at task level and override the playlevel variables.
   * Example: Refer to the playbook vars_at_playlevel.yaml
Ansible uses variables which are defined previously to enable more flexibility in playbooks and roles they can be used loop through a set of given values, access various information like hostname of a system and replace certain strings in templates with specific values.

1) shell --> ${var_name} or $var_name
2) Ansible --> {{ var_name }}, it should be always in double braces.

Different ways to specify variables in ansible
1) Define variables at play level.
2) Define variables at task level and override the playlevel variables.
   * Example: Refer to the playbook vars_at_playlevel.yaml for the 1st and 2nd way of defining.
3) variables from the command prompt.
   * Example: refer to the playbook vars_from_cmd_prompt.yaml
4) Variables from file.
   ```
   vars_files:
       - variablefile.yml
   ```
     * variablefile.yml is the external file to specify the varibales.

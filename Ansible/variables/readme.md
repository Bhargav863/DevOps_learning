Ansible uses variables which are defined previously to enable more flexibility in playbooks and roles they can be used loop through a set of given values, access various information like hostname of a system and replace certain strings in templates with specific values.

shell --> ${var_name} or $var_name
Ansible --> {{ var_name }}, it should be always in double braces.
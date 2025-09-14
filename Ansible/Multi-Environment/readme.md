In real time we have different environments like dev,qa and prod. You have to use the same ansible playbook for all the environments.

How ansible can configure multiple environments with single playbook working in dev and prod?

* Ansible manages multi-environment deployments by separating configurations, inventories, and variables for each environment. This approach ensures that changes intended for one environment (e.g., development) do not inadvertently affect another (e.g., production).
* Maintain distinct inventories for each environment.
* Utilize group_vars and host_vars directories to store variables specific to groups of hosts or individual hosts within an environment.

```
        project_root/
        ├── inventory/
        │   ├── dev/
        │   │   ├── hosts.ini
        │   │   └── group_vars/
        │   │       └── all.yml
        │   └── prod/
        │       ├── hosts.ini
        │       └── group_vars/
        │           └── all.yml
        ├── playbooks/
        │   └── deploy_app.yml
        └── roles/
```

```
ansible-playbook -i inventory/prod playbook.yml
```
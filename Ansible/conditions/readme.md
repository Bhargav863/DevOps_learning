In Ansible, when condition is used to control the execution of tasks based on whether a specified condition is met. It functions similarly to an if statement in other programming languages, allowing tasks to run only when the condition evaluates to True.
```
- name: Example task with a condition
  debug:
    msg: "This message will only print if the condition is true."
  when: some_variable == "expected_value"
```
Ex:- Refer to when.yaml file

* ansible.cfg is placed under the Ansible directory. Go that directory and run the ansible playbook.
  ```
  ansible-playbook conditions/when.yaml
  ```
Assignment
----------
* Take username as variable, and then dynamically check user exists or not then create.
* check a directory exists or not, if not exists create it
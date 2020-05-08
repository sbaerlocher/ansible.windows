# Ansible Role: scheduled_tasks

## Description

You can specify a list of Schedules Tasks to be created under Windows.

## Role Variables

### scheduled_tasks

List of Schedules Tasks, the single parameters can be taken from the [documentation](https://docs.ansible.com/ansible/latest/modules/win_scheduled_task_module.html) of Ansible.

#### Example

```yml
scheduled_tasks:
  - name: 'Chocolatey Packages upgrade'
    description: 'chocolatey upgrade all Packages evry Day at 12:00'
    actions:
      - path: powershell.exe
        working_directory: 'C:\Support\scripts\'
        arguments: '-ExecutionPolicy Bypass -File "C:\Support\scripts\Choco-Update.ps1"'
    triggers:
      - type: daily
        start_boundary: '2017-10-09T12:00:00'
    username: SYSTEM
    state: present
    enabled: true
```

## Example Playbook

```yml
- hosts: all
  collections:
    - sbaerlocher.windows
  roles:
    - scheduled_tasks
```

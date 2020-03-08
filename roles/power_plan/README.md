# Ansible Role: power_plan

## Description

This module will change the power plan of a Windows system to the defined string.

## Role Variables

### power_plan

Here you can specify the Windows Power Plan to be activated..

```yml
power_plan: 'high performance'
```

## Example Playbook

```yml
- hosts: all
  roles:
    - sbaerlocher.windows.power_plan
```

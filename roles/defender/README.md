# Ansible Role: defender

## Description

Disables or enables Windows defender on the Windows system.

## Role Variables

### defender_disable

Disables or enables Windows defender on the Windows system.

```yml
defender_disable: true
```

## Example Playbook

```yml
- hosts: all
  collections:
    - sbaerlocher.windows
  roles:
    - defender
```

# Ansible Role: wsl

## Description

The role activates the Windows Subsystem for Linux (WSL) feature on a windows device.

## Role Variables

### wsl_enable

Switches the WSL on or off.

```yml
wsl_enbale: false
```

## Example Playbook

```yml
- hosts: all
  collections:
    - sbaerlocher.windows
  roles:
    - wsl
```

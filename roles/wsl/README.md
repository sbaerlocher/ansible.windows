# Ansible Role: wsl

## Description

The role activates the windows wsl feature on a windows device.

## Role Variables

### wsl_enbale

Switches the Windows Subsystem for Linux on or off.

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

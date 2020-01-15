# Ansible Role: disks

## Description

Initializes, formats and mounts an additional disk on the target system.

## Role Variables

### disks

A list of all devices to be included on the target system.

```yml
disks:
  - disk_number: 1
    drive_letter: D
    new_label: Data
```

## Example Playbook

```yml
- hosts: all
  collections:
    - sbaerlocher.windows
  roles:
    - directories
```

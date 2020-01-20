# Ansible Role: local_administrators

## Description

Ansible role that adds and removes users and groups to the Local Administrators group.

## Role Variables

### local administrators list

A list of users or groups that Local Administrators
should have rights to on the device.

```yml
local_administrators_defaults: []
local_administrators_groups: []
local_administrators_hosts: []
```

#### example local administrators list

```yml
local_administrators_defaults:
  - UserX
  - GroupX
```

### Pure Option

If the state is enabled, only the specified elements will persist,
and all other unspecified existing elements are removed.

```yml
local_administrators_pure_enable: false
```

### local administrators group

Name of the local administrators group like e.g.
English Administrators or German Administratoren

```yml
local_administrators_group: Administrators
```

## Example Playbook

```yml
- hosts: all
  collections:
    - sbaerlocher.windows
  roles:
    - local_administrators
```

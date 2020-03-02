# Ansible Role: optional_features

## Description

This role enables or disables Windows optional feature..

## Role Variables

### optional_features

Here is a list of Windows optional features that can be installed or uninstalled.

```yml
optional_features:
  - 'Microsoft-Windows-Subsystem-Linux': true
```

## Example Playbook

```yml
- hosts: all
  collections:
    - sbaerlocher.windows
  roles:
    - optional_features
```

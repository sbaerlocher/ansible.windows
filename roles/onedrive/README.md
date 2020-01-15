# Ansible Role: onedrive

## Description

Disables or removes Microsoft OneDrive on a Windows 10 device.

## Role Variables

## onedrive_disable

Disables OneDrive in the registry

```yml
onedrive_disable: true
```

## onedrive_remove

Uninstalls OneDrive on the device.

```yml
onedrive_remove: false
```

## Example Playbook

```yml
- hosts: all
  roles:
    - sbaerlocher.windows.onedrive
```

# Ansible Role: files

## Description

Downloads a file or creates one from a structure.

## Role Variables

### Files

List of configuration dictionary defining the content.

```yml
files:
  - type: content
    path: "c:\\support"
    name: 'test'
    extension: json
    content:
      HEALTHCHECK_URL: 'https://healthchecks.itigo.tech'
      HEALTCHECKS_CHOCO_API_KEY: hallo
```

## Example Playbook

```yml
- hosts: all
  collections:
    - sbaerlocher.windows
  roles:
    - files
```

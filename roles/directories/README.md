# Ansible Role: directories

## Description

Creates various directory structures on the target system.

## Role Variables

### directories

With directories you can specify a list of directories with subdirectories to be created on the target system.

```yml
directories:
  - main: "{{ ansible_env.SystemDrive }}\\{{ directories_main }}"
    subdirectories:
      - 'facts.d'
      - 'xml.d'
      - 'tools.d'
      - 'ansible'
```

### directories_main [Optional]

Optional root directory to be created.

```yml
directories_main: Support
```

## Example Playbook

```yml
- hosts: all
  collections:
    - sbaerlocher.windows
  roles:
    - directories
```

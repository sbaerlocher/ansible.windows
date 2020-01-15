# Ansible Role: membership

## Description

Adds the target device to a domain or to a workgroup.

## Role Variables

### membership_domain_name

the DNS name of the domain to which the targeted Windows host should be joined.

```yml
# membership_domain_name: ''
```

### membership_admin_user

Username of a domain admin for the target domain (required to join or leave the domain).

```yml
membership_admin_user: ''
```

### membership_admin_password

Password for the specified domain_admin_user.

```yml
membership_admin_password: ''
```

### membership_ou

The desired OU path for adding the computer object. default: omit

```yml
membership_ou: '{{ omit }}'
```

### membership_state

Whether the target host should be a member of a domain or workgroup.

```yml
membership_state: 'domain'
```

### membership_workgroup_name

When state is workgroup, the name of the workgroup that the Windows host should be in.

```yml
# membership_workgroup_name: ''
```

## Example Playbook

```yml
- hosts: all
  collections:
    - sbaerlocher.windows
  roles:
    - membership
```

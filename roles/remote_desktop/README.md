# Ansible Role: remote-desktop

## Description

Enables Windows Remote Desktop Services on Windows.

## Role Variables

### remote_desktop_enabled

Turns the Remote Desktop Service on or off.

```yml
remote_desktop_enabled: false
```

### remote_desktop_minencryptionLevel

Determines the encryption level of the remote desktop connection. More on: [![getadmx doc](https://img.shields.io/badge/getadmx-doc-blue.svg)](https://getadmx.com/?Category=Windows_10_2016&Policy=Microsoft.Policies.TerminalServer::TS_ENCRYPTION_POLICY)

```yml
remote_desktop_minencryptionLevel: '3'
```

### remote_desktop_port

Determines on which port the Remote Desktop Service should be started.

```yml
remote_desktop_port: 3389
```

### remote_desktop_shutdown_disable

Disables the the shutdown option from a remote desktop.

```yml
remote_desktop_shutdown_disable: false
```

### remote_desktop_securitylayer

Determines the security level of the remote desktop connection. More on: [![getadmx doc](https://img.shields.io/badge/getadmx-doc-blue.svg)](https://getadmx.com/?Category=Windows_10_2016&Policy=Microsoft.Policies.TerminalServer::TS_SECURITY_LAYER_POLICY)

```yml
remote_desktop_securitylayer: '1'
```

### remote_desktop_group

Group for logging on to the Remote Desktop Service.

```yml
remote_desktop_group: 'Remotedesktopbenutzer'
```

### remote_desktop_members

Users or groups who are allowed to log on to the Remote Desktop.

```yml
remote_desktop_members: []
```

## Example Playbook

```yml
- hosts: all
  roles:
    - sbaerlocher.remote-desktop
```

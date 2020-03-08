# Ansible Role: startlayout

## Description

With this role the default start menu and task bar of a new profile can be defined.

## Role Variables

### startlayout_start

List and groups of application in Start menu.

```yml
startlayout_start:
  - group: Computer
    icons:
      - Size: '2x2'
        Column: '0'
        Row: '0'
        DesktopApplicationLinkPath: "%APPDATA%\\Microsoft\\Windows\\Start Menu\\Programs\\System Tools\\File Explorer.lnk"
      - Size: '2x2'
        Column: '2'
        Row: '0'
        DesktopApplicationLinkPath: "%APPDATA%\\Microsoft\\Windows\\Start Menu\\Programs\\System Tools\\computer.lnk"
  - group: Browser
    icons:
      - Size: '2x2'
        Column: '0'
        Row: '0'
        DesktopApplicationLinkPath: "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Mozilla Firefox.lnk"
  - group: Office
    icons:
      - Size: '2x2'
        Column: '0'
        Row: '0'
        DesktopApplicationLinkPath: "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Acrobat Reader DC.lnk"
      - Size: '2x2'
        Column: '2'
        Row: '0'
        DesktopApplicationLinkPath: "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Word 2016.lnk"
      - Size: '2x2'
        Column: '0'
        Row: '2'
        DesktopApplicationLinkPath: "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Outlook 2016.lnk"
      - Size: '2x2'
        Column: '2'
        Row: '2'
        DesktopApplicationLinkPath: "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Excel 2016.lnk"
      - Size: '2x2'
        Column: '2'
        Row: '0'
        DesktopApplicationLinkPath: "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Word.lnk"
      - Size: '2x2'
        Column: '0'
        Row: '2'
        DesktopApplicationLinkPath: "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Outlook.lnk"
      - Size: '2x2'
        Column: '2'
        Row: '2'
        DesktopApplicationLinkPath: "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Excel.lnk"
```

### startlayout_task

List of Application that are pinned to the taskbar.

```yml
startlayout_task:
  - taskbar: DesktopApp
    DesktopApplicationLinkPath: "%APPDATA%\\Microsoft\\Windows\\Start Menu\\Programs\\System Tools\\File Explorer.lnk"
  - taskbar: DesktopApp
    DesktopApplicationLinkPath: "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Firefox.lnk"
  - taskbar: DesktopApp
    DesktopApplicationLinkPath: "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Outlook 2016.lnk"
  - taskbar: DesktopApp
    DesktopApplicationLinkPath: "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Word 2016.lnk"
  - taskbar: DesktopApp
    DesktopApplicationLinkPath: "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Excel 2016.lnk"
  - taskbar: DesktopApp
    DesktopApplicationLinkPath: "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Outlook.lnk"
  - taskbar: DesktopApp
    DesktopApplicationLinkPath: "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Word.lnk"
  - taskbar: DesktopApp
    DesktopApplicationLinkPath: "%ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Excel.lnk"
```

## Example Playbook

```yml
- hosts: all
  roles:
    - sbaerlocher.windows.startlayout
```

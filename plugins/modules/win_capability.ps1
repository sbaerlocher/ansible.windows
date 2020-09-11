#!powershell

# Copyright: (c) 2020, Simon Baerlocher <s.baerlocher@sbaerlocher.ch>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

#AnsibleRequires -CSharpUtil Ansible.Basic

$spec = @{
    options             = @{
        name  = @{ type = "list"; elements = "str"; required = $true }
        state = @{ type = "str"; default = "present"; choices = @("absent", "present") }
    }
    supports_check_mode = $true
}

$module = [Ansible.Basic.AnsibleModule]::Create($args, $spec)

$name = $module.Params.name
$state = $module.Params.state

$module.Result.reboot_required = $false

if (-not (Get-Command -Name Get-WindowsCapability -ErrorAction SilentlyContinue)) {
    $module.FailJson("This version of Windows does not support the Get-WindowsCapability.")
}


foreach ($capability_name in $name) {
    try {
        $capability_state_start = Get-WindowsCapability -Online -Name $capability_name
    }
    catch [System.Runtime.InteropServices.COMException] {
        $capability_state_start = $null
    }
    if (-not $capability_state_start) {
        $module.FailJson("Failed to find Capability '$capability_name'")
    }

    if ($state -eq "present" -and $capability_state_start.State -like "*NotPresent*") {
        if (-not $module.CheckMode) {
            Add-WindowsCapability -Online -Name $capability_name
            #$module.Result.reboot_required = $action_result.RestartNeeded
        }
        $module.Result.changed = $true
    }
    elseif ($state -eq "absent" -and $capability_state_start.State -notlike "NotPresent") {
        if (-not $module.CheckMode) {
            $action_result = Remove-WindowsCapability -Online -Name $capability_name
            $module.Result.reboot_required = $action_result.RestartNeeded
        }
        $module.Result.changed = $true
    }
}

$module.ExitJson()

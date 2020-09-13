#!powershell

# Copyright: (c) 2020, Simon Baerlocher <s.baerlocher@sbaerlocher.ch>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

#AnsibleRequires -CSharpUtil Ansible.Basic

$spec = @{
    options             = @{
        path  = @{ type = 'str'; required = $true; }
        key   = @{ type = 'str'; required = $true; aliases = 'key' }
        name  = @{ type = 'str'; aliases = 'entry', 'value' }
        data  = @{ type = 'raw' }
        type  = @{
            type    = 'str'
            default = 'string'
            choices = 'none', 'binary', 'dword', 'expandstring', 'multistring', 'string', 'qword'
            aliases = 'datatype'
        }
        state = @{ type = 'str'; default = 'present'; choices = 'present', 'absent' }

    }
    supports_check_mode = $true
}

$module = [Ansible.Basic.AnsibleModule]::Create($args, $spec)

$path = $module.Params.path
$key = $module.Params.key
$name = $module.Params.name
$data = $module.Params.data
$type = $module.Params.type
$state = $module.Params.state

$module.Result.reboot_required = $false

if (-not (Get-Command -Name Get-PolicyFileEntry -ErrorAction SilentlyContinue)) {
    $module.FailJson("This version of Windows does not support the Get-PolicyFileEditor.")
}

try {
    $policy_state = Get-PolicyFileEntry -Path $path -Key $key -ValueName $Name
}
catch [System.Runtime.InteropServices.COMException] {
    $policy_state = $null
}

if ($state -eq "present" -and ($policy_state).data -notlike $data) {
    if (-not $module.CheckMode) {
        Set-PolicyFileEntry -Path $path -Key $key -ValueName $name -Data $data -Type $type
    }
    $module.Result.changed = $true
}
elseif ($state -eq "absent") {
    if (-not $module.CheckMode) {
        Remove-PolicyFileEntry -Path $path -Key $key -ValueName $name
    }
    $module.Result.changed = $true
}

$module.ExitJson()

#!powershell
# (c) 2017, David Baumann <daBONDi@users.noreply.github.com>
# GNU GENERAL PUBLIC LICENSE v3
#
# WANT_JSON
# POWERSHELL_COMMON

Set-StrictMode -Version 2;
$ErrorActionPreference = "Stop";

# Compare Exclusion Lists if we need to Change something
function Compare-ExclusionLists($Current,$Desired,$Cleanup)
{
  # We got nothing to Compare agains on Current so we need to change something
  if($Current -eq $null -and $Desired -ne $null){ return $true;};

  # We got nothing to Compare agains and $null is $null so nothing to change here
  if($Current -eq $null -and $Desired -eq $null){ return $false;};

  # We got nothing Desired and we also should not cleanup so we have nothing to change
  if($Desired -eq $null -and -not $Cleanup) { return $false};

  # We got nothing Desired but we NEED to Cleanup so we have to change
  if($Desired -eq $null -and $Cleanup) { return $true;};

  $diff = Compare-Object -ReferenceObject $Current -DifferenceObject $Desired -CaseSensitive:$false

  # Ensure Nothing is missing on the from the Desired List
  if( $($diff | Where-Object { $_.sideIndicator -eq "=>" }) ){
        return $true;
  }else{
        # Check for Leftovers on the current Setting
        if( $($diff | Where-Object { $_.sideIndicator -eq "<=" }) -and $Cleanup){
            return $true;
        }
        return $false;
  }
}

# Return current exclusion list of the desired type
function Get-CurrentExclusionList($ExclusionType){
  return Get-MpPreference | Select-Object -ExpandProperty $("Exclusion" + $ExclusionType);
}

# Set the Defined Exclusion List
function Set-ExclusionList($ExclusionType,$List,$Cleanup=$false){

  if($List){
    # We got some Values to Set
    $setParam = @{};
    $setParam.Add($("Exclusion" + $ExclusionType),$List);
    Set-MpPreference @setParam;
  }else{
    # We got a empty list
    if($Cleanup){
      # We need to Force Removal
      $valuesToRemove = Get-MpPreference | Select-Object -ExpandProperty $("Exclusion" + $ExclusionType);
      foreach($v in $valuesToRemove)
      {
        $removeParam=@{}
        $removeParam.Add($("Exclusion" + $ExclusionType),$v);
        Remove-MpPreference @removeParam;
      }
    }
  }
}

# Defining Defaults
$changed = $false;

# Setting and Reading Params from Ansible
$parsed_args = Parse-Args $args -supports_check_mode $true;
$check_mode = Get-AnsibleParam $parsed_args "_ansible_check_mode" -default $false;

$clean = Get-AnsibleParam $parsed_args "clean" -default $false;
[string[]]$list = Get-AnsibleParam $parsed_args "list" -default [];
$type = Get-AnsibleParam $parsed_args "type" -validateset "Process","Extension","Path";


# Ensure List is Unique, Self fix some errored input
$list = $list | Sort-Object -Property @{Expression={$_.Trim()}} -Unique

# See if we need to Change something
[string[]]$current = Get-CurrentExclusionList -ExclusionType $type;
$haveToChange = Compare-ExclusionLists -Current $current -Desired $list -Cleanup $clean

# Check
if(-not $check_mode -and $haveToChange)
{
  # Lets do some Real Work
  if(-not $clean)
  {
    # We need to build a combined list with current and desired Values
    $list = $list + $current;
    $list = $list | Sort-Object -Property @{Expression={$_.Trim()}} -Unique
  }
  Set-ExclusionList -ExclusionType $type -List $list -Cleanup $clean
  $changed = $true

}else{
  # Dry Check Mode
  $changed = $haveToChange
}

$result = @{
  changed=$changed
  list=$list
}

Exit-Json $result;

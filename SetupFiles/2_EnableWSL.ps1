#Show WSL feature states
$WSL = [bool]((Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux | Select-Object -ExpandProperty State) -eq 'Enabled')
$VMP = [bool]((Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform | Select-Object -ExpandProperty State) -eq 'Enabled')

#Enable WSL &VMP feature
if (!($WSL -and $VMP)){
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
  Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart
  Restart-Computer
}

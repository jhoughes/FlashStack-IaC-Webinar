#Set verbosity to give periodic status
$VerbosePreference = "Continue"

#Update core PowerShell modules, plus some ease-of-use PS Modules
Write-Verbose 'Updating/installing PowerShell package mgmt modules'
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.208 -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module PackageManagement -MinimumVersion 1.4.7 -Force -AllowClobber
Install-Module PowerShellGet -MinimumVersion 2.2.5 -Force -AllowClobber

#Install VSCode & Terraform
Write-Verbose 'Installing VSCode & Terraform via Chocolatey'
choco upgrade vscode -y
choco upgrade vscode-powershell -y
choco upgrade vscode-icons -y
choco upgrade terraform -y

#Install Platform PowerShell Modules
Write-Verbose 'Installing platform PowerShell Modules'

#Pure Storage
Write-Verbose 'Installing Pure Modules'
Install-Module -Name PureStoragePowerShellSDK
Install-Module -Name PureStoragePowerShellSDK2
Install-Module -Name PureStorage.FlashArray.VMware
#Install-Module -Name PureStoragePowerShellToolkit

#VMware PowerCLI
Write-Verbose 'Installing PowerCLI Module'
Install-Module -Name VMware.PowerCLI -AllowClobber
Set-PowerCLIConfiguration -Scope User -ParticipateInCeip $true -DefaultVIServerMode Multiple -Confirm:$false

#CiscoUCS
#Write-Verbose 'Installing Cisco Modules'
#Install-Module -Name Cisco.UCS.Common -AcceptLicense
#Install-Module -Name Cisco.UCSManager -AcceptLicense
#Install-Module -Name Intersight.PowerShell -AcceptLicense

#Update help & show completion
Update-Help -ErrorAction SilentlyContinue

Write-Verbose 'PowerShell Setup Complete.'
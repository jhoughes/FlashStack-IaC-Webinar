#PowerShell Get API Token
$User = 'pureuser'
$Password = 'pureuser'
$secpasswd = ConvertTo-SecureString $Password -AsPlainText -Force
$Credentials = New-Object System.Management.Automation.PSCredential($User, $secpasswd)
$pureendpoint = 'flasharray1.testdrive.local'

$Array = New-PfaArray -EndPoint $pureendpoint -Credentials ($Credentials)
Write-Output "Array API token is '$($Array.ApiToken)'"

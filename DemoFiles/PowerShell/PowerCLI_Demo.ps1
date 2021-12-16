$vcname = 'vcenter.testdrive.local'
$vcuser = 'pureuser'
$vcpass = 'pureuser'
$vccluster = 'TestDrive'
$volname = 'PowerCLI-Demo-Datastore1'
$volcapacityTB = '5'

$pureendpoint = 'flasharray1.testdrive.local'
$pureuser = 'pureuser'
$purepass = ConvertTo-SecureString 'pureuser' -AsPlainText -Force
$purecred = New-Object System.Management.Automation.PSCredential -ArgumentList ($pureuser, $purepass)

#Connect to Flash Array
$array = New-PfaConnection -Endpoint $pureendpoint -Credentials $purecred -DefaultArray

#Connect to vCenter Server
$vc = Connect-VIServer $vcname -User $vcuser -Password $vcpass -WarningAction SilentlyContinue

#Create Hosts and Hostgroup
New-PfaHostGroupfromVcCluster -Flasharray $array -Cluster (Get-Cluster $vccluster -Server $vc) -Iscsi

#Configure ESXi Cluster for ISCSI to Flash Array
Set-ClusterPfaiSCSI -Cluster (Get-Cluster $vccluster) -Flasharray $array

#Create Volume, Attach to HostGroup and Provision VMFS Datastore
New-PfaVmfs -Flasharray $array -Cluster (Get-Cluster $vccluster -Server $vc) -VolName $volname -SizeInTB $volcapacityTB

#Disconnect from vCenter Server
Disconnect-VIServer -Server $vc -Confirm:$false

#Disconnect Array
$array = $null
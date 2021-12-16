#Install WSL & Ubuntu  - downloads are 230MB (18.04) and 430MB (20.04)
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile ~/Ubuntu1804.zip -UseBasicParsing
New-Item -ItemType Directory -Path C:\Distros\Ubuntu1804
Expand-Archive ~/Ubuntu1804.zip C:\Distros\Ubuntu1804
Remove-Item ~/Ubuntu1804.zip

#Launch WSL - 18.04
Start-Process C:\Distros\Ubuntu1804\ubuntu1804.exe
#After WSL initializes at first start, enter your new username/password

#region Ubuntu 20.04
<#
#Install WSL & Ubuntu  - downloads are 230MB (18.04) and 430MB (20.04)

Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile ~/Ubuntu2004.zip -UseBasicParsing
New-Item -ItemType Directory -Path C:\Distros\Ubuntu2004
Expand-Archive ~/Ubuntu2004.zip C:\Distros\Ubuntu2004
Remove-Item ~/Ubuntu2004.zip

#Set distro to use WslFs
wslconfig.exe /upgrade Ubuntu-20.04

#Launch WSL - 20.04
Start-Process C:\Distros\Ubuntu2004\ubuntu2004.exe
#After WSL initializes at first start, enter your new username/password

#>
#endregion Ubuntu 20.04

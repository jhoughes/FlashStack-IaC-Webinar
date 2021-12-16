#Install Git
choco upgrade git -y --params '/GitAndUnixToolsOnPath /WindowsTerminal /SChannel'
refreshenv

#Download Git repo
& 'C:\Program Files\Git\cmd\git.exe' clone https://github.com/ucs-compute-solutions/Flashstack-IaC-UCSM6.git "$HOME\Downloads\FS-CVD"
& 'C:\Program Files\Git\cmd\git.exe' clone https://github.com/jhoughes/FlashStack-IaC-Webinar "$HOME\Downloads\FS-IaC-Demo"

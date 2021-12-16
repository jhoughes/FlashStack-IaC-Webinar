#!/bin/bash

#Following setup steps are performed as user, no interactive sudo required
#Upgrade Pip, install virtualenv, add to path
GREEN='\033[1;32m'
NC='\033[0m'
echo -e "${GREEN}Updating Pip, installing virtualenv${NC}"
python3 -m pip install --upgrade pip
python3 -m pip install virtualenv
PATH=$HOME/.local/bin:$PATH
export PATH

#Global Python modules & Ansible collections
python3 -m pip install ansible
python3 -m pip install purestorage
python3 -m pip install py-pure-client
python3 -m pip install pyvmomi
ansible-galaxy collection install purestorage.flasharray

#Create virtual environment & clone
echo -e "${GREEN}Create virtual environment & cloning code${NC}"
python3 -m virtualenv pureansible  # Create a virtualenv named 'pureansible' if one does not already exist
source pureansible/bin/activate   # Activate the virtual environment named 'pureansible'
cd pureansible
git clone https://github.com/ucs-compute-solutions/Flashstack-IaC-UCSM6.git FS-CVD
git clone https://github.com/jhoughes/FlashStack-IaC-Webinar FS-IaC-Demo

#Install Ansible, Pure Storage modules & Ansible collections in Python virtual environment (within WSL)
echo -e "${GREEN}Installing Ansible, Pure Storage modules & Ansible collections (in virtualenv)${NC}"
python3 -m pip install ansible
python3 -m pip install purestorage
python3 -m pip install py-pure-client
python3 -m pip install pyvmomi
ansible-galaxy collection install purestorage.flasharray

echo -e "${GREEN}WSL Python virtual environment setup has completed${NC}"

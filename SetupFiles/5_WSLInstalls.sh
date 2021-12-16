#!/bin/bash

###Everything below is within WSL

#Launch an interactive root shell for initial setup
#Do this by running 'sudo -i' and entering your password
#This is just to get around sudo prompts if too much time passes in between commands

#Update apt cache & upgrade
GREEN='\033[1;32m'
NC='\033[0m'
echo -e "${GREEN}Starting script, updating apt cache${NC}"
sudo apt update && sudo apt upgrade -y

#Install Terraform (within WSL) - https://www.terraform.io/docs/cli/install/apt.html
echo -e "${GREEN}Installing Terraform${NC}"
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt install terraform -y
echo -e "${GREEN}Terraform version is $(terraform --version)${NC}"

#Install Ansible - globally
echo -e "${GREEN}Installing Ansible${NC}"
sudo apt install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible ansible-lint -y

echo -e "${GREEN}WSL setup script has completed${NC}"

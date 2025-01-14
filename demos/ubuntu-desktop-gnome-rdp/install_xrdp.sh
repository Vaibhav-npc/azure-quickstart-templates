#!/bin/bash
touch /etc/apt/sources.list
sudo apt-get -y upgrade
sudo apt-get -y update


#install gnome desktop
sudo apt-get install ubuntu-gnome-desktop -y

#install xrdp
sudo apt-get install xrdp -y

# change access from root only to all users
sudo sed -i 's/allowed_users=console/allowed_users=anybody/' /etc/X11/Xwrapper.config

#start remote desktop session
sudo service xrdp restart

#install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

#install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

#install java
sudo apt install openjdk-8-jre-headless -y

#install maven
sudo apt install maven -y



#install VSCode
logger -t devvm "Installing VSCode: $?"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install -y code
logger -t devvm "VSCode Installed: $?"
logger -t devvm "Success"
exit 0

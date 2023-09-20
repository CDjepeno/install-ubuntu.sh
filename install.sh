#!/bin/bash

# Update package list
sudo apt update

# Install Notion
wget https://notion.davidbailey.codes/notion-linux.list
sudo mv notion-linux.list /etc/apt/sources.list.d/
sudo apt update
sudo apt install notion-desktop

# Install Visual Studio Code
sudo apt install software-properties-common
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

# Install Discord
wget -O ~/discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo apt install ~/discord.deb

# Install Docker Desktop
wget https://desktop.docker.com/linux/stable/Docker-CE.x86_64.deb
sudo dpkg -i Docker-CE.x86_64.deb
sudo apt-get install -f
sudo usermod -aG docker $USER

# Install Docker
sudo apt install docker.io

# Start and enable Docker service (to ensure it starts on boot)
sudo systemctl start docker
sudo systemctl enable docker

# Add your user to the "docker" group to run Docker commands without sudo
sudo usermod -aG docker $USER

echo "Installation completed!"
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

echo "Installation completed!"
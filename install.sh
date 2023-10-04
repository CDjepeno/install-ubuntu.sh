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

# Installer PostgreSQL
sudo apt install -y postgresql postgresql-contrib

# Installer Git
sudo apt install git

# Télécharger le fichier d'installation Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.23.0-amd64.deb -O slack.deb
# Installer Slack à partir du fichier .deb téléchargé
sudo dpkg -i slack.deb
# Si vous avez des dépendances non satisfaites, exécutez la commande suivante pour les résoudre :
# sudo apt install -f
# Supprimer le fichier .deb après l'installation
rm slack.deb

# Installez curl s'il n'est pas déjà installé
sudo apt update
sudo apt install curl -y

# Installez NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# Chargez NVM dans la session actuelle
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# Installez Node.js version >= 18.0.0
nvm install 18.0.0
# Définissez Node.js version 18.0.0 comme la version par défaut
nvm alias default 18.0.0

# Téléchargez la clé de Google Chrome et ajoutez-la au trousseau APT
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
# Ajoutez le référentiel Google Chrome à la liste des sources APT
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
# Mettez à jour la liste des paquets
sudo apt update
# Installez Google Chrome
sudo apt install google-chrome-stable -y
# Affichez la version installée
google-chrome --version
# Supprimez le fichier de clé téléchargé
rm linux_signing_key.pub

echo "Installation completed!"
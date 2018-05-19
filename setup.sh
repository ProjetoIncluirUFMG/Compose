#!/bin/bash

set -ex

sudo apt-get update -y
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
	unzip wget git curl -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install docker-ce -y

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

mkdir /dev.incluir && cd /dev.incluir
wget https://github.com/ProjetoIncluirUFMG/Compose/archive/google-deploy.zip
unzip google-deploy.zip
cp -R Compose-google-deploy/* ./ && rm -rf Compose-google-deploy/

git clone "https://github.com/ProjetoIncluirUFMG/AdminApp.git" admin
git clone "https://github.com/ProjetoIncluirUFMG/API.git" api
git clone "https://github.com/ProjetoIncluirUFMG/CadastroFrontEnd.git" cadastro
mkdir ./database/mysql

./install_dependencies.sh
docker-compose up -d --build

cd ./database

sleep 60
/bin/bash ./restore_backup.sh ./schema.sql ./db_migration.sql
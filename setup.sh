#!/bin/bash

set -ex

apt-get update -y
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
	unzip wget git curl -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update -y
apt-get install docker-ce -y

curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

if [ -d "/var/compose" ]; then
    docker-compose down --rmi all
    rm -rf /var/compose
fi
git clone -b google-deploy --single-branch https://github.com/ProjetoIncluirUFMG/Compose.git /var/compose
cd /var/compose

git clone "https://github.com/ProjetoIncluirUFMG/AdminApp.git" admin
git clone "https://github.com/ProjetoIncluirUFMG/API.git" api
git clone "https://github.com/ProjetoIncluirUFMG/CadastroFrontEnd.git" cadastro
mkdir ./database/mysql

./install_dependencies.sh
docker-compose up -d --build

cd ./database

sleep 60
/bin/bash ./restore_backup.sh ./schema.sql ./db_migration.sql
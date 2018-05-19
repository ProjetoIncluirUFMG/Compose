#!/bin/bash

set -ex

mkdir dev.incluir && cd dev.incluir
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
sudo apt-get install p7zip -y
7zr x backup.sql.7z

# sleep 60
# /bin/bash ./restore_backup.sh ./backup.sql ./db_migration.sql
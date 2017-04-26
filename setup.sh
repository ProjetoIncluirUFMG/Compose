#!/bin/bash
# Projeto Incluir Setup

echo ">>> Setup em processo!"

echo ">>> Clonando repositorios"
for app in AdminApp CadastroAppAPI CadastroAppFrontEnd Documentacao; do
		git clone "git@github.com:ProjetoIncluirUFMG/$app.git" "../$app"
done

echo ">>> Destruindo containers existentes"
docker-compose down

echo ">>> Instalando dependencias para as aplicaçōes"
/bin/bash ./database/install_dependencies.sh

echo ">>> Criando containers para as aplicaçōes"
docker-compose up -d --build

echo ">>> Recuperando banco de dados..."
sleep 30
/bin/bash ./database/restore_backup.sh ./database/backup.sql

echo ">>> Recuperação concluida!"

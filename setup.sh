#!/bin/bash
# Projeto Incluir Setup

echo ">>> Setup em processo!"

for app in AdminApp; do
		git clone "git@github.com:ProjetoIncluirUFMG/$app.git" "../$app"
done

docker-compose down
docker-compose up -d

echo ">>> Recuperando banco de dados..."

sleep 30

/bin/bash ./database/restore_backup.sh ./database/backup.sql

echo ">>> Recuperação concluida!"

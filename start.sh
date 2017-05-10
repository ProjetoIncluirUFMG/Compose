#!/bin/bash
# Projeto Incluir Start

echo ">>> Destruindo containers existentes"
docker-compose down

echo ">>> Criando container para o banco de dados"
docker-compose up -d db 

echo ">>> Recuperando banco de dados..."
sleep 30
/bin/bash ./database/restore_backup.sh ./database/backup.sql

echo ">>> Recuperação concluida!"

echo ">>> Criando containers para as aplicaçōes"
docker-compose up -d

echo ">>> Start completo!"


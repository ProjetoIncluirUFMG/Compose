#!/bin/bash
# Projeto Incluir - Restaurar Banco de Dados

echo ">>> Recuperando banco de dados..."

/bin/bash ./database/restore_backup.sh ./database/backup.sql

echo ">>> Recuperação concluida!"
#!/bin/bash
# Projeto Incluir - Setup dos Projetos

echo ">>> Setup em processo!"

echo ">>> Clonando repositorios"
for app in AdminApp API CadastroFrontEnd Documentacao; do
		git clone "git@github.com:ProjetoIncluirUFMG/$app.git" "../$app"
done

if [ "$1" == 'reset' ]; then 
	echo ">>> Destruindo containers existentes"
	docker-compose down --rmi all
fi

echo ">>> Instalando dependencias para as aplicaçōes"
/bin/bash ./install_dependencies.sh

echo ">>> Criando containers para as aplicaçōes"
docker-compose up -d --build

echo ">>> Recuperando banco de dados..."
sleep 30
/bin/bash ./database/restore_backup.sh ./database/backup.sql

echo ">>> Recuperação concluida!"

echo ">>> Criar entradas no hosts file: /etc/hosts"
cat <<END | sudo tee -a /etc/hosts
127.0.0.1 local-api.projetoincluir.com local-cadastro.projetoincluir.com local-admin.projetoincluir.com local-db.projetoincluir.com
END

echo ">>> Setup completo!"

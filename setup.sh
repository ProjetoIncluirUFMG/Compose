#!/bin/bash
# Projeto Incluir Setup

echo "Hello World!"

for app in AdminApp; do
		git clone "git@github.com:ProjetoIncluirUFMG/$app.git" "../$app"
done

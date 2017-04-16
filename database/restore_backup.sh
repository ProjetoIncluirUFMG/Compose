#!/bin/bash
# Projeto Incluir Setup

# mysql --host=127.0.0.1 --port=3306 --user=projeto_incluir_user --password=projeto_incluir_pw
# source backup.sql

mysql --host=127.0.0.1 --port=3306 --user=root --password=root --database=projeto_incluir_db < $1

#!/bin/bash
# Projeto Incluir Setup

# mysql --host=127.0.0.1 --port=3306 --user=projeto_incluir_user --password=projeto_incluir_pw
# source backup.sql

# Database copy
mysql --host=127.0.0.1 --port=3306 --user=root --database=projeto_incluir_db < $1

# Data base migrations
mysql --host=127.0.0.1 --port=3306 --user=root --database=projeto_incluir_db < $2

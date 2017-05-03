## Instalação local:

-	Instale o Docker para [Windows](https://www.docker.com/docker-windows) ou  [MacOSX](https://www.docker.com/docker-mac)

-	Instale o [MySQL-5.7](https://dev.mysql.com/downloads/installer/)

- Instale o 7-Zip para [Windows](http://www.7-zip.org/download.html) ou [MacOSX](http://www.kekaosx.com/en/)

- Clone o repositorio ```git clone git@github.com:ProjetoIncluirUFMG/Compose.git```

- Descomprima o arquivo dentro do diretorio ```Compose/database/backup.7zip```
	- Somente envolvidos na equipe de TI tem acesso a senha para descomprimir esse arquivo

- Execute o script setup.sh: ```cd Compose && ./setup.sh```
	- Caso você já tenha feito o setup e queira re-fazer o processo, execute: ```cd Compose && ./setup.sh reset```

- Pronto! :)

## Acesso:

- Para acessar a plataforma de administrador: ```local-admin.projetoincluir.com```

- Para acessar a api da plataforma de cadastro: ```local-api.projetoincluir.com```

- Para acessar o front-end da plataforma de cadastro: ```local-cadastro.projetoincluir.com```

## Outras instruções:

- Para desligar os containers: ```docker-compose stop```

- Para ligar os containers: ```docker-compose start```

- Para destruir os containers: ```docker-compose down```

- Para instalar novos pacotes da plataforma de cadastro: ```./install_dependencies```

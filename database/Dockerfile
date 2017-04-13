FROM mysql:5.7
RUN mkdir /tmp/backup
COPY ./backup.sql /tmp/backup/backup.sql
RUN /etc/init.d/mysql start && \
		mysql --user=root --password=projeto_incluir_pw < ./tmp/backup/backup.sql

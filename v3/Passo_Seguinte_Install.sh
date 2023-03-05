# https://www.zabbix.com/download?zabbix=6.2&os_distribution=ubuntu&os_version=22.04&components=server_frontend_agent&db=mysql&ws=nginx

# Conectar o rds
mysql -h rds -P 3306 -uadmin -padmin1234

# Crie o banco de dados
create database zabbix character set utf8 collate utf8_bin;

# SHOW DATABASES;

quit;

# No servidor do Zabbix, importe o esquema inicial e os dados.
zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql -h rds -uadmin -padmin1234 zabbix

# Editar arquivo /etc/zabbix/zabbix_server.conf
sudo nano /etc/zabbix/zabbix_server.conf

# Editar as informações abaixo conforme seu ambiente:

dbHost=rds

DBUser=admin    

DBPassword=admin1234   

sudo nano /etc/zabbix/nginx.conf

# server {
#        listen          8080;
#        server_name     54.89.150.26;

# descontar as linhas acima

# Inicie o servidor Zabbix e os processos do agente
sudo dpkg-reconfigure locales

# usar o space do teclado para marcar

Escolher  pt_BR.UTF-8 UTF-8
Depois    pt_BR.UTF-8

sudo systemctl restart zabbix-server zabbix-agent2 nginx php8.1-fpm

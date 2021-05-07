drop database if exists db_europasprak;
create database db_europasprak character set utf8mb4 collate utf8mb4_unicode_ci;
use mysql;
grant all privileges on db_europasprak.* to europasprak@'%' identified by 'DB_PASSWORD';
flush privileges;
show grants for europasprak@'%';

drop database if exists db_folkuniversitet;
create database db_folkuniversitet character set utf8mb4 collate utf8mb4_unicode_ci;
use mysql;
grant all privileges on db_folkuniversitet.* to folkuniversitet@'%' identified by 'DB_PASSWORD';
flush privileges;

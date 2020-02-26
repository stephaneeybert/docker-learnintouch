drop database if exists db_thalasoft;
create database db_thalasoft character set utf8mb4 collate utf8mb4_unicode_ci;
use mysql;
grant all privileges on db_thalasoft.* to thalasoft@'%' identified by 'DB_PASSWORD';
flush privileges;

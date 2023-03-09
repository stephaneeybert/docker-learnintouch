drop database if exists db_fhs;
create database db_fhs character set utf8mb4 collate utf8mb4_unicode_ci;
use mysql;
grant all privileges on db_fhs.* to fhs@'%' identified by 'kidnqpaneus';
flush privileges;

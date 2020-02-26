drop database if exists db_learnintouch;
create database db_learnintouch character set utf8mb4 collate utf8mb4_unicode_ci;
use mysql;
grant all privileges on db_learnintouch.* to learnintouch@'%' identified by 'DB_PASSWORD';
flush privileges;

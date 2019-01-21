The root password is created as a secret

```
echo "root" | docker secret create db_root_password -

docker secret inspect db_root_password
```

The hostname is given by Docker and is the name of the container running MySQL
A MySQL connection from another container will need to use that hostname


Creating the database and the root user
```  
cd mariadb
docker stack deploy --compose-file docker-compose-dev.yml mariadb
docker stack rm mariadb
```

Creating the database and the root user in production
```  
cd mariadb
docker stack deploy --compose-file docker-compose.yml mariadb
docker stack rm mariadb
```


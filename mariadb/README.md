The root password is created as a secret

```
echo "root" | docker secret create db_root_password -

docker secret inspect db_root_password
```


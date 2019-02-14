#!/bin/bash -x

docker build -t stephaneeybert/www.thalasoft --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/www.thalasoft localhost:5000/www.thalasoft
docker push localhost:5000/www.thalasoft
docker tag stephaneeybert/www.thalasoft thalasoft.com:5000/www.thalasoft
docker push thalasoft.com:5000/www.thalasoft
fi

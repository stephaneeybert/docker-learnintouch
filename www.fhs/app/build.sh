#!/bin/bash -x

docker build -t stephaneeybert/www.fhs --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/www.fhs localhost:5000/www.fhs
docker push localhost:5000/www.fhs
docker tag stephaneeybert/www.fhs europasprak.com:5000/www.fhs
docker push europasprak.com:5000/www.fhs
fi

#!/bin/bash -x

docker build -t stephaneeybert/www.fhs-install --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/www.fhs-install localhost:5000/www.fhs-install
docker push localhost:5000/www.fhs-install
docker tag stephaneeybert/www.fhs-install europasprak.com:5000/www.fhs-install
docker push europasprak.com:5000/www.fhs-install
fi

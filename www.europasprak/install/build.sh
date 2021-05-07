#!/bin/bash -x

docker build -t stephaneeybert/www.europasprak-install --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/www.europasprak-install localhost:5000/www.europasprak-install
docker push localhost:5000/www.europasprak-install
docker tag stephaneeybert/www.europasprak-install europasprak.com:5000/www.europasprak-install
docker push europasprak.com:5000/www.europasprak-install
fi

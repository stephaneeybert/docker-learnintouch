#!/bin/bash -x

docker build -t stephaneeybert/www.europasprak --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/www.europasprak localhost:5000/www.europasprak
docker push localhost:5000/www.europasprak
docker tag stephaneeybert/www.europasprak europasprak.com:5000/www.europasprak
docker push europasprak.com:5000/www.europasprak
fi

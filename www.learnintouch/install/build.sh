#!/bin/bash -x

docker build -t stephaneeybert/www.learnintouch-install --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/www.learnintouch-install localhost:5000/www.learnintouch-install
docker push localhost:5000/www.learnintouch-install
docker tag stephaneeybert/www.learnintouch-install europasprak.com:5000/www.learnintouch-install
docker push europasprak.com:5000/www.learnintouch-install
fi

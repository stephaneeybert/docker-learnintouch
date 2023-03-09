#!/bin/bash -x

docker build -t stephaneeybert/www.folkuniversitet --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/www.folkuniversitet localhost:5000/www.folkuniversitet
docker push localhost:5000/www.folkuniversitet
docker tag stephaneeybert/www.folkuniversitet europasprak.com:5000/www.folkuniversitet
docker push europasprak.com:5000/www.folkuniversitet
fi

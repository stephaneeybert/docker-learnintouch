FROM stephaneeybert/nodejs

RUN apt-get install -y vim \
  && apt-get install -y wget \
  && apt-get install -y telnet

RUN mkdir -p /usr/bin/learnintouch/

WORKDIR /usr/bin/learnintouch/

RUN npm install formidable http https path connect cookie socket.io redis socket.io-redis lodash

COPY start.sh /usr/bin/learnintouch/
RUN chmod 755 /usr/bin/learnintouch/*

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "/usr/bin/learnintouch/start.sh", "-D FOREGROUND"]

# Build the container: docker build -t stephaneeybert/nodejs-learnintouch .
# Rename the image: docker tag stephaneeybert/nodejs-learnintouch thalasoft.com:5000/nodejs-learnintouch
# Push the image: docker push thalasoft.com:5000/nodejs-learnintouch
# Run the container: docker run -d -p 9001:9001 -v /home/stephane/dev/php/projects/learnintouch/engine:/usr/bin/learnintouch/engine --link redis:redis  --name nodejs-learnintouch stephaneeybert/nodejs-learnintouch
# Check that the port is open: nmap -p 9001 localhost
# Open a shell in the container: docker exec -it nodejs-learnintouch bash


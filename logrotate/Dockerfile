FROM ubuntu:16.04

RUN apt-get update \
  && apt-get install -y vim \
  && apt-get install -y logrotate

WORKDIR /etc/logrotate.d/

COPY httpd.rotate.conf /etc/logrotate.d/

ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
#ENTRYPOINT ["/usr/bin/logrotate/src/logrotate-server", "/usr/bin/logrotate/install/etc/6379.conf"]

# Build the container: docker build -t stephaneeybert/logrotate .
# Rename the image: docker tag stephaneeybert/logrotate thalasoft.com:5000/logrotate
# Push the image: docker push thalasoft.com:5000/logrotate
# Run the container: docker run -d --name logrotate stephaneeybert/logrotate
# Open a shell in the container: docker exec -it logrotate bash
# View the log: tail -400f TODO

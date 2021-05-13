FROM ubuntu:20.10

RUN apt-get update \
  && apt-get install -y sudo vim \
  && apt-get autoremove -y && apt-get clean

RUN mkdir -p /usr/local/learnintouch/
RUN apt-get install -y cron
COPY learnintouch.cron /usr/local/learnintouch/
RUN chmod 0644 /usr/local/learnintouch/learnintouch.cron \
  && crontab /usr/local/learnintouch/learnintouch.cron

#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["cron", "-f"]

# docker build -t stephaneeybert/cronissue .
# docker run --name cronissue stephaneeybert/cronissue -v ~/dev/docker/projects/common/volumes/logs:/usr/local/learnintouch/logs
# docker stack deploy --compose-file docker-compose.yml cronissue
# docker stack rm cronissue

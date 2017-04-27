FROM ubuntu:17.04
ENV DEBIAN_FRONTEND noninteractive

USER root

WORKDIR /var/linc

ADD . /var/linc

EXPOSE 80

RUN apt update && apt install -y nodejs npm
RUN cd /var/linc && npm install
RUN nodejs --version

CMD ["nodejs","app.js"]


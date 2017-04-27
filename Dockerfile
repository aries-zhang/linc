FROM ubuntu:17.04
ENV DEBIAN_FRONTEND noninteractive

USER root

WORKDIR /var/linc

ADD . /var/linc

EXPOSE 80

RUN apt update && apt install -y nodejs npm supervisor
RUN cd /var/linc && npm install
RUN echo "0">/var/linc/temp.txt

RUN service supervisor stop
RUN cd /etc/supervisor/conf.d
RUN echo "[program:long_script]" > linc.conf
RUN echo "command=nodejs /var/linc/app.js" >> linc.conf
RUN echo "autostart=true" >> linc.conf
RUN echo "autorestart=true" >> linc.conf

CMD ["service","supervisor", "start"]


FROM nginx

COPY ./default.conf /etc/nginx/conf.d/default.conf

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/certbot.list
RUN apt-get update && apt-get install certbot -t jessie-backports -y && apt-get install cron rsyslog -y && rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /entrypoint.sh
COPY ./updatecerts.sh /updatecerts.sh

RUN rm /etc/cron.d/certbot

COPY ./updatecerts /etc/cron.d/updatecerts

VOLUME /etc/letsencrypt/

EXPOSE 80 443 9001 9002

ENTRYPOINT [ "/entrypoint.sh" ]

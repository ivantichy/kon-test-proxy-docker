FROM nginx

COPY ./default.conf /etc/nginx/conf.d/default.conf

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/certbot.list
RUN apt-get update && apt-get install certbot -t jessie-backports -y && rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /entrypoint.sh

EXPOSE 80 443

ENTRYPOINT [ "/entrypoint.sh" ]

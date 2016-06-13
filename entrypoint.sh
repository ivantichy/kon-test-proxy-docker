#!/bin/bash


if [ \! -f  /etc/letsencrypt/live/jira.ivantichy.cz/privkey.pem ]; then
  certbot certonly --standalone --break-my-certs -d jira.ivantichy.cz --renew-by-default --email ivan.tichy@gmail.com --agree-tos --standalone-supported-challenges tls-sni-01
  openssl dhparam -rand - 2048 >> /etc/letsencrypt/live/jira.ivantichy.cz/cert.pem
fi


if [ \! -f  /etc/letsencrypt/live/jenkins.ivantichy.cz/privkey.pem ]; then
  certbot certonly --standalone --break-my-certs -d jenkins.ivantichy.cz --renew-by-default --email ivan.tichy@gmail.com --agree-tos --standalone-supported-challenges tls-sni-01
  openssl dhparam -rand - 2048 >> /etc/letsencrypt/live/jenkins.ivantichy.cz/cert.pem
fi

bash -c "/updatecert.sh"

service nginx start

#exec nginx -g "daemon off;"

trap "service nginx stop; service cron stop; service rsyslog stop;echo \"Correctly stopped.\"; exit 0" SIGINT SIGTERM

service rsyslog start
service cron start

while :
do
 sleep 1
done


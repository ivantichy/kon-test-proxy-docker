#!/bin/bash

certbot renew --standalone --pre-hook "service nginx stop" --post-hook "service nginx start; echo a" >> /var/log/certupdate.log 2>&1

if [ "`cat /etc/letsencrypt/live/jira.ivantichy.cz/cert.pem | grep -c "BEGIN DH PARAMETERS"`" == "0" ]; then
  echo "generating DH"
  openssl dhparam -rand - 2048 >> /etc/letsencrypt/live/jira.ivantichy.cz/cert.pem
  service nginx restart
fi

if [ "`cat /etc/letsencrypt/live/jenkins.ivantichy.cz/cert.pem | grep -c "BEGIN DH PARAMETERS"`" == "0" ]; then
  echo "generating DH"
  openssl dhparam -rand - 2048 >> /etc/letsencrypt/live/jenkins.ivantichy.cz/cert.pem
  service nginx restart
fi

if [ "`cat /etc/letsencrypt/live/bitbucket.ivantichy.cz/cert.pem | grep -c "BEGIN DH PARAMETERS"`" == "0" ]; then
  echo "generating DH"
  openssl dhparam -rand - 2048 >> /etc/letsencrypt/live/bitbucket.ivantichy.cz/cert.pem
  service nginx restart
fi





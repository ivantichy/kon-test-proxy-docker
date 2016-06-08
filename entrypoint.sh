#!/bin/bash
service cron start
certbot certonly --standalone --test-cert --break-my-certs -d jira.ivantichy.cz --renew-by-default --email ivan.tichy@gmail.com --agree-tos --standalone-supported-challenges tls-sni-01
certbot certonly --standalone --test-cert --break-my-certs -d jenkins.ivantichy.cz --renew-by-default --email ivan.tichy@gmail.com --agree-tos --standalone-supported-challenges tls-sni-01
exec nginx -g daemon off

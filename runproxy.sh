#/bin/bash

docker run -d -p 80:80 -p 443:443 -v /var/docker-data/letsencrypt/:/etc/letsencrypt/ ivantichy/kon-test-proxy

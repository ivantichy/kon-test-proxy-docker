#/bin/bash

docker run -d -p 80:80 -p 443:443 -p 9001:9001 -p 9002:9002 -v /var/docker-data/letsencrypt/:/etc/letsencrypt/ ivantichy/kon-test-proxy

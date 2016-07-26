#/bin/bash

docker run -d -p 80:80 -p 443:443 -p 90001:90001 -p 90002:90002 -v /var/docker-data/letsencrypt/:/etc/letsencrypt/ ivantichy/kon-test-proxy

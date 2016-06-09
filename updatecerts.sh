#!/bin/bash

certbot renew --standalone --pre-hook "service nginx stop" --post-hook "service nginx start; echo a" >> /var/log/certupdate.log 2>&1




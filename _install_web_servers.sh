#!/bin/bash -v

apt-get install \
  nginx \
  python3-certbot-nginx \
  -y

# assert server is working
curl http://127.0.0.1:80

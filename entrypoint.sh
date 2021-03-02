#!/bin/sh

set -eu

envsubst '$$PORT$$HOST_IP$$CERTIFICATE_FILENAME$$PRIVATEKEY_FILENAME$$DOMAIN$$DOMAINPORT$$CLIENTMAXBODYSIZE' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
cat /etc/nginx/nginx.conf
nginx


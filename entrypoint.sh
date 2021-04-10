#!/bin/sh

set -eu


if [[ ! -z $CARDDAV ]]; then sed -i '/<carddav>/,/<\/carddav>/g' /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf.template; fi
if [[ ! -z $CALDAV ]]; then sed -i '/<caldav>/,/<\/caldav>/g' /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf.template; fi
envsubst '$$PORT$$HOST_IP$$CERTIFICATE_FILENAME$$PRIVATEKEY_FILENAME$$DOMAIN$$DOMAINPORT$$CLIENTMAXBODYSIZE$$STRICTTRANSPORTSECURITY' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
cat /etc/nginx/nginx.conf
nginx


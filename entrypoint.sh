#!/bin/sh

set -eu


envsubst '$$PORT$$HOST_IP$$CERTIFICATE_FILENAME$$PRIVATEKEY_FILENAME$$DOMAIN$$DOMAINPORT$$CLIENTMAXBODYSIZE$$STRICTTRANSPORTSECURITY$$MATOMOURL' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

if [[ -z $CARDDAV ]]; then sed -i '/<carddav>/,/<\/carddav>/g' /etc/nginx/nginx.conf; fi
sed -i 's/<carddav>//g;s/<\/carddav>//g' /etc/nginx/nginx.conf;

if [[ -z $CALDAV ]]; then sed -i '/<caldav>/,/<\/caldav>/g' /etc/nginx/nginx.conf; fi
sed -i 's/<caldav>//g;s/<\/caldav>//g' /etc/nginx/nginx.conf;

if [[ -z $MATOMOURL ]]; then sed -i '/<matomo>/,/<\/matomo>/g' /etc/nginx/nginx.conf; fi
sed -i 's/<matomo>//g;s/<\/matomo>//g' /etc/nginx/nginx.conf;

cat /etc/nginx/nginx.conf
nginx
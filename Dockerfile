FROM alpine:3.6

LABEL maintainer="bvmensvoort <info@bvmensvoort.nl>"

ENV NGINX_VERSION 1.13.5
ENV CLIENTMAXBODYSIZE 1M
ENV CERTIFICATE_FILENAME nginx.pem
ENV PRIVATEKEY_FILENAME nginx.key
ENV DOMAIN localhost
ENV DOMAINPORT 443
ENV STRICTTRANSPORTSECURITY \"max-age=63072000; includeSubdomains;\"
ENV CARDDAV ""
ENV CALDAV ""
ENV MATAMOURL ""

RUN apk add --no-cache openssl nginx gettext \
    && mkdir -p /etc/nginx/ssl/ \
    && openssl req -new -x509 -sha256 -newkey rsa:2048 -days 365 -nodes -out /etc/nginx/ssl/${CERTIFICATE_FILENAME} -keyout /etc/nginx/ssl/${PRIVATEKEY_FILENAME} -subj "/C=JP/ST=MyState/L=MyLocality/O=MyOrg/OU=dev/CN=localhost" \
    && mkdir -p /run/nginx/

COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY entrypoint.sh .

EXPOSE 443
STOPSIGNAL SIGTERM

VOLUME /etc/nginx/ssl

ENTRYPOINT sh entrypoint.sh

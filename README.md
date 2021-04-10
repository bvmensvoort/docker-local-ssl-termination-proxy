# Docker Local SSL Termination Proxy

A simple SSL Termination Proxy for accessing https://[YOUR_DOMAIN].

This proxy is easy to use (1 command to launch) and nothing is installed on your local machine thanks to Docker.

## Requirement

- Docker (1.10.0+)

## Usage

### Docker settings

For example your domain is sub.example.com, and your internal website is hosted on 192.168.0.2.
Use for your environment variables:
- `HOST_IP` = 192.168.0.2 (can be a DNS name)
- `CERTIFICATE_FILENAME` = sub.example.com-fullchain.txt (can be any filename which contains the full chain of certificates; file must exist on volume root)
- `PRIVATEKEY_FILENAME` = sub.example.com.key (private key to decrypt the SSL encryption; file must exist on volume root)
- `DOMAIN` = sub.example.com
- `DOMAINPORT` = 80 (or any port which Nextcloud will reply to)
- `CLIENTMAXBODYSIZE` = 1G (To allow uploading of larger files)
- `STRICTTRANSPORTSECURITY` = "max-age=63072000; includeSubdomains;" (needed for security, the quotes are needed)
- `CALDAV` = empty (use "true" when you are using .well-known/caldav redirect)
- `CARDDAV` = empty (use "true" when you are using .well-known/carddav redirect)

For the volume, set:
- `/etc/nginx/ssl` - make sure your certificate files are placed on this volume

### Mac OSX

```bash
docker run -it \
  -e "HOST_IP=`ipconfig getifaddr en0`" \
  -e "PORT=8000" \
  -p 443:443 \
  --rm \
  esplo/docker-local-ssl-termination-proxy
```

### Linux

```bash
docker run -it \
  -e "HOST_IP=`hostname -I | awk '{print $1}'`" \
  -e "PORT=8000" \
  -p 443:443 \
  --rm \
  esplo/docker-local-ssl-termination-proxy
```

### Other platform

Only you have to do is to change the command for 'HOST_IP'.

### Test connection

```bash
$ curl -k https://localhost/
```

## License

See the [LICENSE](LICENSE) file for license rights and limitations (MIT).


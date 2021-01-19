### Custom Nginx Reverse Proxy using Certbot and Cloudflare DNS challenge for my home  
#### To build dockerfile
```
docker build -f Dockerfile . -t hjaltiatla/rproxy:1
```
#### Start docker-compose 
```
docker-compose up -d
```
#### Copy conf.d folder into /etc/nginx  
```
docker cp conf.d/ nginx-rproxy_app_1:/etc/nginx/
```
#### Copy secrets into folder   /root/.secrets/certbot/cloudflare.ini
```
docker cp cloudflare.ini nginx-rproxy_app_1:/root/.secrets/certbot/
```
#### connect to container 
```
docker container exec -it nginx-rproxy_app_1 /bin/bash
```
#### change permissions on /root/.secrets/certbot/cloudflare.ini
```
chmod 600 /root/.secrets/certbot/cloudflare.ini
```
#### Create certificate
```
certbot certonly \
  --dns-cloudflare \
  --dns-cloudflare-credentials ~/.secrets/certbot/cloudflare.ini \
  -d example.com
```

#### reload nginx service
```
  service nginx reload
```

FROM nginx:1.19

RUN apt-get update -y && apt-get upgrade -y && \
    apt install -y certbot python-certbot-nginx python3-certbot-dns-cloudflare nano

RUN mkdir -p /root/.secrets/certbot/




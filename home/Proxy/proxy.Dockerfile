# Self-signed SSL reverse proxy with docker
#
# Starting from arm32v7/nginx image, based on Oliver Zampieri post below.
#  https://medium.com/@oliver.zampieri/self-signed-ssl-reverse-proxy-with-docker-dbfc78c05b41
#
#  Key and Cert files were generated separately at RPI:
#  /usr/bin/openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout key.pem -out cert.pem -days 365

FROM arm32v7/nginx

WORKDIR /app
COPY Proxy/setup/proxy.conf /etc/nginx/conf.d/
COPY Proxy/setup/key.pem /etc/nginx/conf.d/
COPY Proxy/setup/cert.pem /etc/nginx/conf.d/

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]

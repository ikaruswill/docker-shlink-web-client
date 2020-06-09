FROM nginx:1.19.0-alpine
ARG VERSION
RUN rm -r /usr/share/nginx/html && rm /etc/nginx/conf.d/default.conf \
    wget -O /etc/nginx/conf.d/default.conf https://raw.githubusercontent.com/shlinkio/shlink-web-client/${VERSION}/config/docker/nginx.conf \
    && wget -O /tmp/shlink-web-client.zip https://github.com/shlinkio/shlink-web-client/releases/download/${VERSION}/shlink-web-client_${VERSION#v}_dist.zip \
    && unzip /tmp/shlink-web-client.zip -d /tmp \
    && mv /tmp/shlink-web-client_${VERSION#v}_dist /usr/share/nginx/html \
    && rm -rf /tmp/shlink-web-client.zip
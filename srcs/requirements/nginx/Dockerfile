FROM alpine:3.15

RUN apk update && \
    apk add nginx openrc --no-cache && \
    adduser -u 82 -G www-data  -D www-data && \
    # adduser -D -g 'www' www && \
    mkdir /var/www/html && \
    chown -R www-data:www-data /var/lib/nginx && \
    chown -R www-data:www-data /var/www/html && \
    mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup

ARG WP_PORT=9000
ARG WP_N

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN sed -i 's/<WP_PORT>/'"${WP_PORT}"'/g' /etc/nginx/nginx.conf
RUN sed -i 's/<WP_N>/'"${WP_N}"'/g' /etc/nginx/nginx.conf
# COPY ./conf/index.html /www/index.html
COPY ./conf/nginx-selfsigned.key /etc/nginx/nginx-selfsigned.key
COPY ./conf/nginx-selfsigned.crt /etc/nginx/nginx-selfsigned.crt

EXPOSE 80 443 8081 8082


CMD ["nginx", "-g", "daemon off;"]

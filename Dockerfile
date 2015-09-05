FROM hypriot/rpi-alpine-scratch
MAINTAINER Adam Ossenford <AdamOssenford@gmail.com>
RUN apk update && apk add nginx && echo "daemon off;" >> /etc/nginx/nginx.conf \
 && mkdir -p /tmp/nginx/client-body

# Bring in the baymax
COPY html /usr/share/nginx/html/
COPY start_nginx.sh /

# Expose port 80
EXPOSE 80

# Run nginx
CMD /start_nginx.sh

FROM alpine:edge

RUN apk update --no-cache && \
apk upgrade --no-cache && \
apk add --no-cache  curl lighttpd bash libsmbclient php7-fpm  php7-ctype php7-dom php7-gd php7-iconv php7-json php7-xml php7-mbstring php7-posix php7-simplexml php7-xmlreader php7-xmlwriter php7-zip php7-zlib php7-pdo_mysql php7-curl ph$
mkdir  /var/www/localhost/htdocs/nextcloud

RUN apk add --no-cache php7-fpm php7-pdo_pgsql php7-session php7-mysqli  php7-mbstring php7-xml php7-gd php7-zlib php7-bz2 php7-zip php7-openssl php7-curl php7-opcache php7-json php7 php7-common php7-iconv php7-json php7-gd php7-curl ph$

RUN curl --insecure -s https://download.nextcloud.com/server/releases/latest.tar.bz2 | tar xj -C /var/www/localhost/htdocs/nextcloud --strip-components=1 &&  echo "<?php phpinfo(); ?>" > /var/www/localhost/htdocs/index.php && echo "Test$

RUN echo 'include "mod_fastcgi_fpm.conf"' >> /etc/lighttpd/lighttpd.conf

EXPOSE 80

RUN  chown -R lighttpd:nobody  /var/www/localhost/htdocs/ &&  find /var/www/localhost/htdocs/ -type d -exec chmod 770 {} \; && find /var/www/localhost/htdocs/ -type f -exec chmod 660 {} \;

CMD php-fpm7 -D && lighttpd -D -f /etc/lighttpd/lighttpd.conf

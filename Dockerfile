FROM alpine:latest

RUN apk add global --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
apk add py-pip ctags && \
apk add apache2 perl && \
mkdir /run/apache2 && \
pip install Pygments

ADD php-src-php-7.2.6 /var/www/localhost/php-src

WORKDIR /var/www/localhost/php-src

#RUN gtags -v && \
#htags -aosnfvF

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND", "-f", "/etc/apache2/httpd.conf"]
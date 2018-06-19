FROM alpine:latest

RUN apk add global --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
apk add py-pip ctags && \
apk add apache2 perl && \
mkdir /run/apache2 && \
pip install Pygments

ADD httpd.conf /etc/apache2/httpd.conf
#RUN gtags -v && \
#htags -aosnfvF

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND", "-f", "/etc/apache2/httpd.conf"]
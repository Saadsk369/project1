FROM ubuntu:latest
MAINTAINER "saads@gmail.com"
RUN apt-get update -y && apt-get install apache2 -y \
     unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip /var/www/html
WORKDIR /var/www/html
RUN unzip oxer.zip
RUN cp -rvf oxer-html/* .
RUN rm -rf oxer.zip oxer-html
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80

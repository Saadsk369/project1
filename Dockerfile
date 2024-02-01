FROM ubuntu:latest
MAINTAINER "saads@gmail.com"
RUN apt-get update -y && apt-get install apache2 -y \
     unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/listrace.zip /var/www/html
WORKDIR /var/www/html
RUN unzip listrace.zip
RUN cp -rvf listrace-v1.0/* .
RUN rm -rf listrace.zip listrace-v1.0
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80


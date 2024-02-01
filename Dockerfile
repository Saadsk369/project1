FROM ubuntu:latest
MAINTAINER "saads@gmail.com"
RUN apt-get update -y && apt-get install apache2 -y \
     unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip /var/www/html
WORKDIR /var/www/html
RUN unzip neogym.zip
RUN cp -rvf neogym-html/* .
RUN rm -rf neogym.zip neogym-html
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80


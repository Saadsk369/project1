FROM centos:latest
MAINTAINER saads@gmail.com
RUN yum update -y
RUN yum install httpd -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/listrace.zip /var/www/html
WORKDIR /var/www/html
RUN unzip listrace.zip
RUN cp -rvf listrace-v1.0/*
RUN rm -rf listrace.zip listrace-v1.0
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80

FROM centos:latest
MAINTAINER saads@gmail.com

# Create a dummy file to avoid 'No such file or directory' error
RUN touch /etc/yum.repos.d/CentOS-AppStream.repo

# Modify the repository configuration
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-AppStream.repo && \
    sed -i 's/#baseurl/baseurl/g' /etc/yum.repos.d/CentOS-AppStream.repo && \
    sed -i 's/mirror.centos.org/mirror.centos.com/g' /etc/yum.repos.d/CentOS-AppStream.repo && \
    yum update -y

# Continue with the rest of your Dockerfile
RUN yum install httpd -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/listrace.zip /var/www/html
WORKDIR /var/www/html
RUN unzip listrace.zip
RUN cp -rvf listrace-v1.0/*
RUN rm -rf listrace.zip listrace-v1.0
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80


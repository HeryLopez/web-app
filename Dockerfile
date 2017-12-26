# base image
FROM debian:8.10

# set maintainer
LABEL maintainer "Hery J Lopez R"

# install apache 
RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*

# expose port 80
EXPOSE 80

# copy src files
ADD ["index.html","/var/www/html/"]

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

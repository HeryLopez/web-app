# base image
FROM nginx:1.12.2-alpine

# set maintainer
LABEL maintainer "Hery J Lopez R"

# expose port 80
EXPOSE 80

# copy src files
COPY html-source /usr/share/nginx/html

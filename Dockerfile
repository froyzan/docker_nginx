# Base OS
FROM debian:buster

MAINTAINER psafflow <psafflow@student.21-school.ru>

# Update and upgrade
RUN apt-get update && apt-get upgrade -y

# Install utilities
RUN apt-get -y install expect wget mariadb-server\
	php7.3 php7.3-cli php7.3-cgi php7.3-mbstring \
	php7.3-fpm php7.3-mysql libnss3-tools nginx\
	gnupg

WORKDIR /var/www/psaf
COPY ./srcs .
EXPOSE 80 443
ENTRYPOINT ["bash"]
CMD ["launch_server.sh"]

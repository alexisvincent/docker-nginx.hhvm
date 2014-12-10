#
# Nginx.HHVM Dockerfile
#
# https://github.com/alexisvincent/docker-nginx.hhvm
#

FROM alexisvincent/nginx:latest

MAINTAINER Alexis Vincent "alexisjohnvincent@gmail.com"

ENV HHVM_VERSION 3.4.0~trusty

RUN wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add - && \
	echo deb http://dl.hhvm.com/ubuntu trusty main | sudo tee /etc/apt/sources.list.d/hhvm.list

# Install supervisor & hhvm; cleanup afterwards
RUN \
	wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add - && \
	echo deb http://dl.hhvm.com/ubuntu trusty main | sudo tee /etc/apt/sources.list.d/hhvm.list && \
	sudo apt-get update && \
	sudo apt-get -y install supervisor hhvm=${HHVM_VERSION} && \
	sudo apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add configs
ADD build/hhvm.conf /etc/nginx/
ADD build/nginx.conf /etc/nginx/
ADD build/default-site /etc/nginx/sites-enabled/default
ADD build/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Auto configure hhvm
RUN /usr/share/hhvm/install_fastcgi.sh

# Container Config
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]
CMD ["/usr/bin/supervisord"]
EXPOSE 80
EXPOSE 443
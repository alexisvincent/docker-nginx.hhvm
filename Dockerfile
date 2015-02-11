#
# Nginx.HHVM Dockerfile
#
# https://github.com/alexisvincent/docker-nginx.hhvm
#

FROM alexisvincent/nginx:1.7.9

MAINTAINER Alexis Vincent "alexisjohnvincent@gmail.com"

ENV HHVM_VERSION 3.5.0~wheezy

# Install supervisor & hhvm; cleanup afterwards
RUN \
	apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 && \
	echo deb http://dl.hhvm.com/debian wheezy main | tee /etc/apt/sources.list.d/hhvm.list && \
	apt-get update && \
	apt-get -y install hhvm=${HHVM_VERSION} supervisor && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add configs
COPY container/php_restrictions.conf /etc/nginx/global/php_restrictions.conf
COPY container/static_asset_caching.conf /etc/nginx/global/static_asset_caching.conf
COPY container/default.conf /etc/nginx/conf.d/default.conf
COPY container/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY container/index.php /data/www/index.php

# Container Config
CMD ["/usr/bin/supervisord"]
EXPOSE 80 443
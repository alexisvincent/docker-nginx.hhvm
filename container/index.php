<!DOCTYPE html>
<html>
<title>alexisvincent/nginx.hhvm</title>
<xmp theme="united" style="display:none;">
## HHVM Dockerfile

This repository contains **Dockerfile** of [HHVM](http://hhvm.com/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/alexisvincent/nginx.hhvm/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [alexisvincent/nginx](https://registry.hub.docker.com/u/alexisvincent/nginx/)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/alexisvincent/nginx.hhvm/) from public [Docker Hub Registry](https://registry.hub.docker.com/): 'docker pull alexisvincent/nginx.hhvm'

   (alternatively, you can build an image from Dockerfile: 'docker build -t="alexisvincent/nginx.hhvm" github.com/alexisvincent/docker-nginx.hhvm'`')


### Usage

    docker run -d -p 80:80 alexisvincent/nginx.hhvm

#### Attach persistent/shared directories

    docker run -d -p 80:80 -v <sites-enabled-dir>:/etc/nginx/sites-enabled -v <certs-dir>:/etc/nginx/certs -v <log-dir>:/var/log/nginx alexisvincent/nginx.hhvm

After few seconds, open `http://<host>` to see the welcome page.

</xmp>

<script src="http://strapdownjs.com/v/0.2/strapdown.js"></script>
</html>
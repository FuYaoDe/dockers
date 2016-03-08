FROM node:4
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy imagemagick graphicsmagick
RUN echo "deb http://deb.torproject.org/torproject.org trusty main" >> /etc/apt/sources.list
RUN echo "deb-src http://deb.torproject.org/torproject.org trusty main" >> /etc/apt/sources.list
RUN gpg --keyserver keys.gnupg.net --recv 886DDD89
RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
RUN apt-get update
RUN apt-get install -qy tor deb.torproject.org-keyring
RUN /bin/bash -l -c "npm install -g gulp"

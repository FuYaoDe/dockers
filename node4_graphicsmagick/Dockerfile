FROM node:4
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy imagemagick graphicsmagick
RUN deb http://deb.torproject.org/torproject.org jessie main
RUN deb-src http://deb.torproject.org/torproject.org jessie main
RUN gpg --keyserver keys.gnupg.net --recv 886DDD89
RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
RUN apt-get update
RUN apt-get install tor deb.torproject.org-keyring
RUN /bin/bash -l -c "npm install -g gulp"

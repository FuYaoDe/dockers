FROM ubuntu:14.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy git man curl imagemagick graphicsmagick


USER root
ENV HOME /root
ENV NODE_VER iojs-v2.3.4


RUN git clone https://github.com/creationix/nvm.git $HOME/.nvm

RUN echo '. ~/.nvm/nvm.sh' >> $HOME/.profile

RUN /bin/bash -l -c "nvm install ${NODE_VER}; nvm alias default ${NODE_VER};"

RUN /bin/bash -l -c "npm install -g gulp"

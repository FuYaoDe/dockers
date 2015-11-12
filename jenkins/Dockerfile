FROM jenkins
USER root
RUN apt-get update
RUN apt-get install wget
RUN wget -qO- https://get.docker.com/ | sh
RUN usermod -aG docker jenkins
USER jenkins
RUN  docker run hello-world

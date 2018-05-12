# This container is designed to run a local Jenkins instance 
# with Docker server installed on the host system.

FROM jenkins/jenkins:lts-alpine

LABEL maintaner="Brodie Slater <brodster22@live.com>"

ENV DOCKERVERSION=17.12.0-ce

USER root

# Create docker group and add user jenkins to the group
RUN addgroup -g 1001 docker \
	&& addgroup jenkins docker

# Download and add Docker client to path to access 
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  && mv docker-${DOCKERVERSION}.tgz docker.tgz \
  && tar xzvf docker.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker.tgz \
  && touch /var/run/docker.sock \
  && chown root:docker /var/run/docker.sock

USER jenkins

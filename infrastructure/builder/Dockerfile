FROM jenkins/jenkins:lts-alpine-jdk21

USER root

RUN apk add --no-cache make docker

RUN delgroup docker && \
    # 988 -- the ID of the docker group in ubuntu images on AWS
    addgroup -g 988 docker && \
    adduser jenkins docker

USER jenkins

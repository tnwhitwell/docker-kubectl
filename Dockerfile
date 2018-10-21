FROM docker:git

MAINTAINER Tom Whitwell version: 1.0

ADD https://storage.googleapis.com/kubernetes-release/release/v1.12.1/bin/linux/amd64/kubectl /bin/kubectl
RUN chmod +x /bin/kubectl

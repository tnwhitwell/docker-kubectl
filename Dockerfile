ARG KUBECTL_VERSION=v1.12.1
ARG HELM_VERSION=v2.11.0

FROM alpine:latest as download
ARG KUBECTL_VERSION
ARG HELM_VERSION

WORKDIR /workspace
RUN wget https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O helm.tar.gz && tar -xzf helm.tar.gz
RUN wget https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -O kubectl

FROM docker:dind

MAINTAINER Tom Whitwell version: 1.0

COPY --from=download /workspace/linux-amd64/helm /usr/local/bin/helm
COPY --from=download /workspace/kubectl /usr/local/bin/kubectl

RUN chmod +x  /usr/local/bin/kubectl && chmod +x /usr/local/bin/helm

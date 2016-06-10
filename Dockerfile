FROM alpine:3.4

ENV NOMAD_VERSION 0.2.2

RUN apk add --no-cache wget ca-certificates \
 && wget https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip \
 && unzip nomad_${NOMAD_VERSION}_linux_amd64.zip \
 && mv nomad /usr/bin/nomad \
 && rm nomad_${NOMAD_VERSION}_linux_amd64.zip \
 && apk del wget ca-certificates

EXPOSE 4646
EXPOSE 4647
EXPOSE 4648

ENTRYPOINT ["/usr/bin/nomad"]

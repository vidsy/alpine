FROM alpine:3.9
LABEL maintainer="Vidsy <tech@vidsy.co>"

ARG VERSION
LABEL version=$VERSION

RUN apk update \
  && apk add make tar curl \
  && rm -rf /var/cache/apk/*

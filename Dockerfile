FROM alpine:3.7
LABEL maintainer="Vidsy <tech@vidsy.co>"

RUN apk update \
  && apk add make tar curl \
  && rm -rf /var/cache/apk/*

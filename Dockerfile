FROM alpine:edge

WORKDIR /data

RUN echo 'https://dl-cdn.alpinelinux.org/alpine/edge/testing/' >> /etc/apk/repositories \
 && apk update \
 && apk add llvm-libunwind librespot \
 && mkfifo /data/fifo

ENV SPOTIFY_NAME Blackview
ENV SPOTIFY_DEVICE /data/fifo

CMD librespot -n "$SPOTIFY_NAME" -u "$SPOTIFY_USER" -p "$SPOTIFY_PASSWORD" --device "$SPOTIFY_DEVICE"

FROM alpine:testing

WORKDIR /data

RUN apk add llvm-libunwind librespot \
 && mkfifo /data/fifo

ENV SPOTIFY_NAME Blackview
ENV SPOTIFY_DEVICE /data/fifo

CMD librespot -n "$SPOTIFY_NAME" -u "$SPOTIFY_USER" -p "$SPOTIFY_PASSWORD" --device "$SPOTIFY_DEVICE"

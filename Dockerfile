ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

RUN apk add --no-progress --no-cache ca-certificates curl ffmpeg python gnupg \
     # Install youtube-dl
     # https://github.com/rg3/youtube-dl
 && curl -Lo /usr/local/bin/youtube-dl https://yt-dl.org/downloads/latest/youtube-dl \
 && curl -Lo youtube-dl.sig https://yt-dl.org/downloads/latest/youtube-dl.sig \
 && gpg --keyserver keyserver.ubuntu.com --recv-keys '7D33D762FD6C35130481347FDB4B54CBA4826A18' \
 && gpg --keyserver keyserver.ubuntu.com --recv-keys 'ED7F5BF46B3BBED81C87368E2C393E0F18A9236D' \
 && chmod a+rx /usr/local/bin/youtube-dl \
     # Clean-up
 && apk del curl gnupg \
     # Create directory to hold downloads.
 && mkdir /downloads \
 && chmod a+rw /downloads \
     # Basic check it works.
 && mkdir /.cache \
 && chmod 777 /.cache \
 && youtube-dl --version

WORKDIR /downloads

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]

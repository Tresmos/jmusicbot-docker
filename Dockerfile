FROM --platform=$TARGETOS/$TARGETARCH alpine:3.19

ENV BOT_VERSION 0.4.3

RUN apk update \
    && apk upgrade \
    && apk add --update openjdk11 curl \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /opt/jmusicbot/data/

ADD https://github.com/jagrosh/MusicBot/releases/download/$BOT_VERSION/JMusicBot-$BOT_VERSION.jar /opt/jmusicbot/JMusicBot.jar

COPY ./entrypoint.sh /opt/jmusicbot/entrypoint.sh

ENTRYPOINT ["/bin/sh", "/opt/jmusicbot/entrypoint.sh"]
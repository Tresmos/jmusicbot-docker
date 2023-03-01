FROM --platform=$TARGETOS/$TARGETARCH openjdk:18.0.2-slim

ENV BOT_VERSION 0.3.9

RUN apt-get update -y \
        && apt-get install -y --no-install-recommends curl \
        && rm -rf /var/lib/apt/lists/* \
        && apt-get autoremove -y \
        && apt-get clean

RUN mkdir -p /opt/jmusicbot/data/

ADD https://github.com/jagrosh/MusicBot/releases/download/$BOT_VERSION/JMusicBot-$BOT_VERSION.jar /opt/jmusicbot/JMusicBot.jar

COPY ./entrypoint.sh /opt/jmusicbot/entrypoint.sh

ENTRYPOINT ["/bin/sh", "/opt/jmusicbot/entrypoint.sh"]

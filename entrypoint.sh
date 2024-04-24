#!/bin/sh

EXAMPLE_CONFIG=https://github.com/Tresmos/jmusicbot-docker/raw/main/config.txt
CONFIG_FILE=/opt/jmusicbot/data/config.txt

set -e

echo "JMusicBot Version: $BOT_VERSION"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "config.txt not found. Downloading example config file..."
    curl -L -sS -o ${CONFIG_FILE} ${EXAMPLE_CONFIG}
    echo "Example config file downloaded. Please edit the config file and restart the container. "
    exit
fi

cd /opt/jmusicbot/data/
exec java -jar -Dconfig=/opt/jmusicbot/data/config.txt -Dnogui=true /opt/jmusicbot/JMusicBot.jar

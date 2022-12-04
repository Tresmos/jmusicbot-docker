#!/bin/sh
BCYAN='\033[1;36m'
BGREEN='\033[1;32m' 
NC='\033[0m'

EXAMPLE_CONFIG=https://github.com/Tresmos/jmusicbot-docker/raw/main/config.txt
CONFIG_FILE=/opt/jmusicbot/data/config.txt

set -e

echo "JMusicBot Version: ${BCYAN}$BOT_VERSION${NC}"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "${BCYAN}config.txt${NC} not found. Downloading example config file..."
    curl -L -sS -o ${CONFIG_FILE} ${EXAMPLE_CONFIG}
    echo "${BGREEN}Example config file downloaded. Please edit the config file and restart the container. "
    exit
fi

cd /opt/jmusicbot/data/
java -jar -Dconfig=/opt/jmusicbot/data/config.txt -Dnogui=true /opt/jmusicbot/JMusicBot.jar

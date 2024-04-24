# JMusicBot Docker
Dockerized version of the best *~~(imo)~~* self-hosted Discord music bot, [JMusicBot by jagrosh](https://github.com/jagrosh/MusicBot)<br>
linux/amd64 and linux/arm64 images available.<br>
[Docker Images](https://github.com/Tresmos/jmusicbot-docker/pkgs/container/jmusicbot)

# Running the Container
If there is no config.txt file located in the data directory, an example config.txt will be downloaded. After configuring the bot just start the container again. [JMusicBot Wiki](https://jmusicbot.com/)
### With Docker Run
`docker run -d --name jmusicbot -v dataDir:/opt/jmusicbot/data/ ghcr.io/tresmos/jmusicbot`
### With Docker Compose
`docker-compose.yml`
```yml
services:
  jmusicbot:
    image: ghcr.io/tresmos/jmusicbot
    container_name: jmusicbot
    network_mode: host
    volumes:
      - ./dataDir:/opt/jmusicbot/data/
```
```
docker compose up -d
docker compose down
```

FROM openjdk:11-jre-slim

VOLUME /data
EXPOSE 8081

RUN apt update \
&& groupadd -g 4242 -r qumine \
&& useradd -g 4242 -m -N -r -u 4242 qumine \
&& curl -o /home/qumine/bluemap.jar https://github.com/BlueMap-Minecraft/BlueMap/releases/download/v1.4.2/BlueMap-1.4.2-cli.jar

USER qumine
WORKDIR /home/qumine/
ENTRYPOINT [ "java", "-jar", "bluemap.jar", "-r", "-w"]
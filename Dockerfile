ARG ARCH=
FROM ${ARCH}openjdk:17-slim-buster

VOLUME /data
EXPOSE 8081

COPY bluemap/ /home/qumine/

RUN apt update \
&& apt install -y unzip wget \
&& groupadd -g 4242 -r qumine \
&& useradd -g 4242 -m -N -r -u 4242 qumine

RUN wget -o /home/qumine/bluemap.jar https://github.com/BlueMap-Minecraft/BlueMap/releases/download/v1.5.5/BlueMap-1.5.5-cli.jar

USER qumine
WORKDIR /home/qumine/
ENTRYPOINT [ "java", "-jar", "bluemap.jar", "-r", "-w", "-u"]
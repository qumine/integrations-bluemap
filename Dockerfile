ARG ARCH=
FROM ${ARCH}openjdk:17-oraclelinux8

VOLUME /data
EXPOSE 8081

COPY bluemap/ /home/qumine/

RUN microdnf update \
&& microdnf install unzip \
&& groupadd -g 4242 -r qumine \
&& useradd -g 4242 -m -N -r -u 4242 qumine

RUN curl -L --output /home/qumine/bluemap.jar https://github.com/BlueMap-Minecraft/BlueMap/releases/download/v1.5.5/BlueMap-1.5.5-cli.jar

USER qumine
WORKDIR /home/qumine/
ENTRYPOINT [ "java", "-jar", "bluemap.jar", "-r", "-w", "-u"]
ARG ARCH=
FROM ${ARCH}openjdk:16-oraclelinux8

EXPOSE 9090

RUN microdnf update \
&& microdnf install unzip \
&& groupadd -g 4242 -r qumine \
&& useradd -g 4242 -m -N -r -u 4242 qumine

USER qumine
WORKDIR /home/qumine/bluemap/

COPY --chown=qumine:qumine bluemap/ /home/qumine/bluemap
RUN curl -L --output /home/qumine/bluemap/bluemap.jar https://github.com/BlueMap-Minecraft/BlueMap/releases/download/v1.7.2/BlueMap-1.7.2-cli.jar

ENTRYPOINT [ "java", "-jar", "bluemap.jar", "-r", "-w", "-u"]
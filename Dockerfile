FROM openjdk:11-jre-slim

VOLUME /data
EXPOSE 8081

COPY bluemap/ /home/qumine/

RUN apt update \
&& groupadd -g 4242 -r qumine \
&& useradd -g 4242 -m -N -r -u 4242 qumine \
&& chown -R qumine:qumine /home/qumine/

USER qumine
WORKDIR /home/qumine/
ENTRYPOINT [ "java", "-jar", "bluemap.jar", "-r", "-w"]
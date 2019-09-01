# BUILD -  docker build . -t 03_minecraft_server
# RUN	-  docker run --rm -d -p 25565:25565 03_minecraft_server	

FROM ubuntu:18.04

RUN	apt-get update && \
	apt-get install -y software-properties-common

RUN	apt-get install wget openjdk-8-jdk-headless -y && mkdir Minecraft_Server

WORKDIR	./Minecraft_Server

RUN	wget https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar

RUN	java -Xms1G -Xmx1G -jar server.jar

RUN	echo "eula=true" > eula.txt

EXPOSE 25565

ENTRYPOINT java -Xmx1G -Xmx1G -jar server.jar
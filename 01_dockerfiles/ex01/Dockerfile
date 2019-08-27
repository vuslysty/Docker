# BUILD:	docker build . --tag ex01
# RUN:		docker run --rm -p 9987:9987/udp -p 10011:10011 -p 30033:30033 ex01

FROM	debian

RUN		apt-get update;\
		apt-get upgrade -y;\
		apt-get install wget bzip2 -y;\
		wget https://files.teamspeak-services.com/releases/server/3.9.1/teamspeak3-server_linux_amd64-3.9.1.tar.bz2 && \
		tar -xvf teamspeak3-server_linux_amd64-3.9.1.tar.bz2;	

EXPOSE 	9987 \
		30033 \
		10011 \
		10022 \
		41144

WORKDIR	teamspeak3-server_linux_amd64

ENTRYPOINT ["sh","ts3server_minimal_runscript.sh", "license_accepted=1"]
# BUILD		docker build -t animal_say .
# RUN		docker run -it --rm animal_say

FROM debian

RUN	apt update && \
	apt install -y lolcat cowsay fortune

COPY	random_animal.sh  /

RUN	chmod 755 ./random_animal.sh

CMD	/usr/games/fortune | /usr/games/cowsay -f `./random_animal.sh` | /usr/games/lolcat
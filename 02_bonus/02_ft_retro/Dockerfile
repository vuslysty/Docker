# BUILD -  docker build . -t 02_ft_retro
# RUN   -  docker run --rm -it 02_ft_retro /bin/bash       // then type "./ft_retro"

FROM ubuntu

RUN 	apt update && \
	apt install libncurses5-dev libncursesw5-dev git build-essential clang -y && \
	git clone https://github.com/vuslysty/piscineCPP.git

WORKDIR		./piscineCPP/rush00/

RUN		make

ENTRYPOINT	/bin/bash
# BUILD -  docker build . -t 01_nodejs_yarn
# RUN   -  docker run --rm -ti 01_nodejs_yarn

FROM ubuntu

RUN 	apt update && \
	apt install nodejs curl gnupg -y && \
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -  && \
	sh -c 'echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list' && \
	apt update &&\
	apt install yarn -y


FROM	ruby

RUN 	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list; \
	apt update && \
	apt upgrade -y && \
	apt install nodejs yarn -y && \
	gem install rails;

ONBUILD COPY app /opt/app

ONBUILD WORKDIR /opt/app/

ONBUILD EXPOSE 3000
ONBUILD RUN bundle install
ONBUILD RUN rake db:migrate
ONBUILD RUN rake db:seed

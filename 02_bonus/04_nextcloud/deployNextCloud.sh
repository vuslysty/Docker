#!/bin/bash

# Deleting old containers and volume
docker rm -f nextCloudDB &> /dev/null;
docker volume rm -f nCloud  &> /dev/null;
docker rm -f nextcloud &> /dev/null; 

# Creating space where be storing BD's data
docker volume create nCloud;

# Creating password for root user in BD
while true; do
	echo -n "Create root password for DB: ";
	read -s MYSQL_ROOT_PASSWORD;
	echo "";

	if [ ! -n "$MYSQL_ROOT_PASSWORD" ];
        then
                echo "Password is empty, please be more careful";
                continue ;
        fi

	echo -n "Repeat your password: ";
	read -s TMP_PASSWORD;
	echo "";
	if [ "$MYSQL_ROOT_PASSWORD" != "$TMP_PASSWORD" ]; 
	then
		echo "Passwords don't match, please be more careful"
	else
		echo "OK!";
		break ;
	fi;
done;

# Creating new BD's container
docker run -d --restart=on-failure:10 --name nextCloudDB -v nCloud:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD mysql:5.7;

# Buiding of NextCloud server
docker build . -t nextcloud

# Creating user for next cloud
echo -n "Create user's name for NextCloud account: ";
        read NEXT_CLOUD_USER_NAME;

while true; do
        echo -n "Create password: ";
        read -s NEXT_CLOUD_USER_PASSWORD;
        echo "";

	if [ ! -n "$NEXT_CLOUD_USER_PASSWORD" ];
	then
		echo "Password is empty, please be more careful";
		continue ;
	fi

        echo -n "Repeat your password: ";
        read -s TMP_PASSWORD;
        echo "";
        if [ "$NEXT_CLOUD_USER_PASSWORD" != "$TMP_PASSWORD" ];
        then
                echo "Passwords don't match, please be more careful"
        else
                echo "OK!";
                break ;
        fi;
done;

docker run -d --name nextcloud --link nextCloudDB:db -e NEXT_CLOUD_USER_NAME=$NEXT_CLOUD_USER_NAME -e NEXT_CLOUD_USER_PASSWORD=$NEXT_CLOUD_USER_PASSWORD -p 4242:80 nextcloud;

echo "Your NextCloud is availeble by next address:"
echo "	$(docker-machine ip Char):4242	"

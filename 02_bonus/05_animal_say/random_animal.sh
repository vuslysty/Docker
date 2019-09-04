#!/bin/bash

RANDOM_ANIMAL=0;

function getRandomAnimal {
        local AnimalArray=("$@")
        local randomNumber=$(($RANDOM % $#))
        RANDOM_ANIMAL=${AnimalArray[$randomNumber]}
}

MASS_ANIMAL=(`ls /usr/share/cowsay/cows/`) && MASS_ANIMAL=(`echo ${MASS_ANIMAL[*]} | sed -e 's/\.cow//g'`)

getRandomAnimal ${MASS_ANIMAL[*]}

echo $RANDOM_ANIMAL
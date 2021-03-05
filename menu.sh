#!/bin/bash

printf '
__  __                  _        __ __
\ \/ /___ _____  ____  (_)____  / //_/
 \  / __ `/ __ \/ __ \/ / ___/ / ,<
 / / /_/ / / / / / / / (__  ) / /| |
/_/\__,_/_/ /_/_/ /_/_/____(_)_/ |_|


'
trap 'printf "\n";stop;exit 1' 2

menu() {

printf "    \e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;91m ms17-010-hote.sh         \e[0m    \n"
printf "    \e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;91m ms17-010-subnetwork.sh   \e[0m   \n"
printf "    \e[1;92m[\e[0m\e[1;77m03\e[0m\e[1;92m]\e[0m\e[1;91m ms17-010-global.sh       \e[0m \n"
printf "    \e[1;92m[\e[0m\e[1;77m04\e[0m\e[1;92m]\e[0m\e[1;91m HashDetector             \e[0m \n"
printf "    \e[1;92m[\e[0m\e[1;77m05\e[0m\e[1;92m]\e[0m\e[1;91m BruteForce zip file      \e[0m \n"
printf "    \e[1;92m[\e[0m\e[1;77m06\e[0m\e[1;92m]\e[0m\e[1;91m BruteForce a web account \e[0m \n"
printf "    \e[1;92m[\e[0m\e[1;77m07\e[0m\e[1;92m]\e[0m\e[1;91m Stéganographie           \e[0m \n"

read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m\en' option


if [[ $option == 1 ]]; then
gnome-terminal -- bash -c intrusion/pentest-hote.sh

elif [[ $option == 2 ]]; then
gnome-terminal -- bash -c intrusion/pentest-sousreseau.sh

elif [[ $option == 3 ]]; then
gnome-terminal -- bash -c intrusion/pentest-global.sh

elif [[ $option == 4 ]]; then
crack/hashdetector.sh

elif [[ $option == 5 ]]; then
crack/bruteforcezip.sh

elif [[ $option == 6 ]]; then
crack/bruteforceweb.sh

elif [[ $option == 7 ]]; then
stegano/stegano.sh

else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
menu
fi
}

menu

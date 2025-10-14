#!/bin/bash

while true; do
	read -p "What do you want to do?" options
	
	if [ "$options" = "Print list" ]; then

		list=("Sled" "Milk carton" "Postcard" "Clothes line" "Fire extinguisher" "Handkerchief" "Combat boots" "Mountain" "Bottle opener" "Waffle")

		for str in "${list[@]}"; do
   			echo "$str"
		done
	elif [ "$options" = "Exit" ]; then
		echo "Bye!"
		break
	else
		echo "This is not a option, please try again"
	fi
done


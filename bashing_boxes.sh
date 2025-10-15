#!/bin/bash
list=("Sled" "Milk carton" "Postcard" "Clothes line" "Fire extinguisher" "Handkerchief" "Combat boots" "Mountain" "Bottle opener" "Waffle")


while true; do
	read -p "What do you want to do?" options
	
	if [ "$options" = "Print list" ]; then
		for str in "${list[@]}"; do
   			echo "$str"
		done
	elif [ "$options" = "Print item at X position in list" ]; then
		read -p "Which one do you want to print? " number
		number=$((number - 1))
		echo "${list[number]}"
	elif [ "$options" = "Add item to the list" ]; then
		read -p "What do you want to add? " item
		list+=("$item")
	elif [ "$options" = "Remove item - from X position" ]; then
		read -p "Which one do you want to remove? " number
		number=$((number - 1))
		unset 'list[number]'
	elif [ "$options" = "Remove last item from the list" ]; then
		unset 'list[-1]'
	elif [ "$options" = "Exit" ]; then
		echo "Bye!"
		break
	else
		echo "This is not a option, please try again"
	fi
done


#!/bin/bash
list=("Sled" "Milk carton" "Postcard" "Clothes line" "Fire extinguisher" "Handkerchief" "Combat boots" "Mountain" "Bottle opener" "Waffle")

print_list(){
	for str in "${list[@]}"; do
		echo "$str"
	done
}

print_select_item(){
	read -p "Which one do you want to print? " number
	number=$((number - 1))
	echo "${list[number]}"
}

add_item(){
	read -p "What do you want to add? " item
	list+=("$item")
}

remove_item(){
	read -p "Which one do you want to remove? " number
	number=$((number - 1))
	unset 'list[number]'
}

remove_last_item(){
	unset 'list[-1]'
}

exit(){
	echo "Bye!"
	break
}

save_to_log(){
	mkdir data
	print_list > data/log.txt
}

load_log(){
	mapfile -t list < data/log.txt
}

print_exsiting_list(){
	load_log
	print_list
}

delete_log(){
	rm data/log.txt
}

while true; do
	echo "Menu: "
	echo "Print list"
	echo "Print item at X position in list"
	echo "Add item to the list"
	echo "Remove item - from X position"
	echo "Remove last item from the list"
	echo "Save"
	echo "Delete the saved box"
	echo "Load the saved box"
	echo "Listing existing saved boxes"
	echo "Exit"

	read -p "What do you want to do?" options
	
	if [ "$options" = "Print list" ]; then
		print_list
	elif [ "$options" = "Print item at X position in list" ]; then
		print_select_item
	elif [ "$options" = "Add item to the list" ]; then
		add_item
	elif [ "$options" = "Remove item - from X position" ]; then
		remove_item
	elif [ "$options" = "Remove last item from the list" ]; then
		remove_last_item
	elif [ "$options" = "Exit" ]; then
		exit
	elif [ "$options" = "Save" ]; then
		save_to_log
	elif [ "$options" = "Delete the saved box" ]; then
		delete_log
	elif [ "$options" = "Load the saved box" ]; then
		load_log
	elif [ "$options" = "Listing existing saved boxes" ]; then
		print_exsiting_list
	else
		echo "This is not a option, please try again"
	fi
done


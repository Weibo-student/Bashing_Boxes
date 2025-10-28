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

add_to_log(){

}

load_log(){

}

print_exsiting_list(){

}

delete_log(){

}

while true; do
	echo "Menu: "
	echo "Print list"
	echo "Print item at X position in list"
	echo "Add item to the list"
	echo "Remove item - from X position"
	echo "Remove last item from the list"
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
	else
		echo "This is not a option, please try again"
	fi
done


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


handle_options(){
	echo -e "\n\n"
	echo "Menu: "
	echo "1. Print list"
	echo "2. Print item at X position in list"
	echo "3. Add item to the list"
	echo "4. Remove item - from X position"
	echo "5. Remove last item from the list"
	echo "6. Save"
	echo "7. Delete the saved box"
	echo "8. Load the saved box"
	echo "9. Listing existing saved boxes"
	echo "10. Exit"
	echo -e "\n\n"

	read -p "What do you want to do? " options
	
	case $options in 
		1)
			print_list
			handle_options
			;;
		2)
			print_select_item
			handle_options
			;;
		3)
			add_item
			handle_options
			;;
		4)
			remove_item
			handle_options
			;;
		5)
			remove_last_item
			handle_options
			;;
		6)
			save_to_log
			handle_options
			;;
		7)
			delete_log
			handle_options
			;;
		8)
			load_log
			handle_options
			;;
		9)
			print_exsiting_list
			handle_options
			;;
		10)
			exit
			;;
		*)
			echo "This is not an option, please try again"
			;;
	esac
}

handle_options

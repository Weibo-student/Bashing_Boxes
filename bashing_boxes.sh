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


save_to_log(){
	mkdir -p data
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

generate_random_box(){
	set -e

	trap "echo 'File does not existed'" ERR

	read -p "How many objects you want?" size

	mapfile -t list < <(shuf -n "$size" warehouse.txt)

	trap - ERR

	save_to_log

	print_exsiting_list
}

search(){
	read -p "What item of part of the item do you want to search?" word

	mapfile -t list < <(grep "$word" warehouse.txt)

	if [[  ${#list[@]} -eq 0 ]]; then
		echo "Nothing found"
		handle_options
	else
		save_to_log
		print_exsiting_list
	fi

}

handle_options(){
	echo -e "
	Menu:
	1. Print list
	2. Print item at X position in list
	3. Add item to the list
	4. Remove item - from X position
	5. Remove last item from the list
	6. Save
	7. Delete the saved box
	8. Load the saved box
	9. Listing existing saved boxes
	10. Generate random box from file
	11. Search
	12. Exit
	"

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
			generate_random_box
			handle_options
			;;
		11)
			search
			handle_options
			;;
		12)
			exit
			;;
		*)
			echo "This is not an option, please try again"
			handle_options
			;;
	esac
}

handle_options

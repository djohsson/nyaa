#!/bin/bash
# nyaa.sh

file="$1"
server=""

check()
{
	extension="${file##*.}"
	if [ $extension = png ] || [ $extension = jpg ]; then
		location="img"
		name=$(date +"%y%m%d%H%M%S"."$extension")
	else
		location="f"
		name=$(basename $file)
	fi
}

transfer()
{
	scp "$file" "$server:/var/www/$location/$name"

}

clipboard()
{
	echo "http://$server/$location/$name" | pbcopy
}

check
transfer
clipboard

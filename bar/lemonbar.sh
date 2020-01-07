#!/usr/bin/bash

Workspace(){
	workspace=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')

	case $workspace in
		([0])	#terminal
			echo -e "\uf120"
			;;
		1)	#firefox
			echo -e "\uf269"
			;;
		2)	#data
			echo -e "\uf1fe"
			;;
		3)	#coding 
			echo -e "\uf1c9"
			;;
		4)	#docker
			echo -e "\uf395"
			;;
		5)	#virtualbox
			echo -e "\uf1cb"
	esac
}


Clock(){
	DATE=$(date "+%m.%d.%y")
	TIME=$(date "+%I:%M")

	
	echo -e -n "\uf073 ${DATE}  \uf017 ${TIME}"
	#echo -e -n "${DATE} ${TIME}"
}

ActiveWindow(){
	echo -n $(xdotool getwindowfocus getwindowname)
}

Sound(){
	NOTMUTED=$( amixer sget Master | grep "\[on\]" )
	if [[ ! -z $NOTMUTED ]] ; then
		VOL=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | sed 's/%//g')
		if [ $VOL -ge 85 ] ; then
			echo -e "\uf028 ${VOL}%"
		elif [ $VOL -ge 50 ] ; then
			echo -e "\uf027 ${VOL}%"
		else
			echo -e "\uf026 ${VOL}%"
		fi
	else
		echo -e "\uf026 M"
	fi
}

Battery(){
	battery_level=$(cat /sys/class/power_supply/BAT1/capacity)
	
	case $(($battery_level)) in
	
	([8-9][0-9]|[0-9][0-9][0-9])
		echo "\uf240 ${battery_level}%"
		;;
	([6-7][0-9])
		echo "\uf241 ${battery_level}%"
		;;
	([3-5][0-9])
		echo "\uf242 ${battery_level}%"
		;;
	([1-2][0-9])
		echo "\uf243 ${battery_level}%"
		;;
	*)
		echo "\uf244 ${battery_level}%"
		;;
	esac

}

while true; do
	echo -e " $(Workspace)  %{c}$(ActiveWindow)"   "%{r} $(Battery)  $(Clock)"
	sleep 0.1s
done

# (sleep 1s && bash lemonbar.sh | lemonbar -g 900x12+500+0 -p -F#FFFFFFFF -B#FF222222)

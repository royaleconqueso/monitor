#!/usr/bin/env bash

##Let's switch some monitors
##
## Run "xrandr" to find out the specific designations of your particular layout. For me  
## it's "eDP-1" and "HDMI-2". You can use the search and replace feature of your text editor to
## change the below script
##


if ! [ -x "$(command -v xrandr)" ]; then
  echo "Oh, no! This script requires that you have mpv installed and available in your path. Exiting" >&2
  exit 1
fi

echo ""
read -n 1 -p " == Which monitor Configuration do you want? == 
1=Laptop Only
2=Laptop and external, mirrored
3=Laptop and external to the right
4=Laptop and external to the left
5=External ONLY
q=quit
==> ? " answer;

clear;

echo ""
echo "Run the script again to change your monitor resolution. Exiting..."
echo ""

case $answer in
        1)
                xrandr --output eDP-1 --auto --output HDMI-2 --off;;

        2)
                xrandr --output eDP-1 --auto --output HDMI-2 --auto;;

        3)
                xrandr --output eDP-1 --auto --output HDMI-2 --auto --right-of eDP-1;;

        4)
                xrandr --output eDP-1 --auto --output HDMI-2 --auto --left-of eDP-1;;

        5)
                xrandr --output eDP-1 --off --output HDMI-2 --auto;;

        q|Q)
                exit::


esac

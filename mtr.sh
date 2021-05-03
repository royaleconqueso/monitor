#!/usr/bin/env bash

##Let's switch some monitors
##
## Run "xrandr" to find out the specific designations of your particular layout. For me  
## it's "eHDMI-2" and "HDMI-2". You can use the search and replace feature of your text editor to
## change the below script. Or choose (x) from the script to find your correct settings.
##


monitor1=$(xrandr | grep connected | grep -v disconnected | awk '{print $1}' | head -n 1)
monitor2=$(xrandr | grep connected | grep -v disconnected | awk '{print $1}' | head -n 2 | tail -n 1)
monitor3=$(xrandr | grep connected | grep -v disconnected | awk '{print $1}' | tail -n 1)

if [ -e $HOME/.config/mtr/mtrsh ]
then
    echo "OK"
else
    echo " *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*- "
    echo " *-*-* This script assumes a maximum of three monitors. The first time this script is run, it is recommended              *-*-* "
    echo " *-*-* that you choose the x option to verify that three monitors are connected, and that xrandr identifies               *-*-* "
    echo " *-*-* them correctly, and that you understand their order. xrandr will maintain the order that they're listed.           *-*-* "
    echo " *-*-*                                                                                                                    *-*-* "
    echo " *-*-* Review the script to ensure you understand how it works, and use at your own risk. No warranty included or implied *-*-* "
    echo " *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*- "
fi

mkdir -m700 -p $HOME/.config/mtr/;
touch $HOME/.config/mtr/mtrsh;
chmod +x $HOME/.config/mtr/mtrsh;
echo "#This config file is largely a placeholder for your mtr.sh script" > $HOME/.config/mtr/mtrsh;
echo "#Details available at https://github.com/royaleconqueso/monitor" >> $HOME/.config/mtr/mtrsh;
echo "" >> $HOME/.config/mtr/mtrsh;
xrandr | grep connected | grep -v disconnected >> $HOME/.config/mtr/mtrsh;
#clear;



if ! [ -x "$(command -v xrandr)" ]; then
  echo "Oh, no! This script requires that you have xrandr installed and available in your path. Exiting" >&2
  exit 1
fi

echo ""
read -n 1 -p " == Which monitor Configuration do you want? == 
1=Laptop Only
2=Laptop and external, mirrored
3=Laptop and external to the right
4=Laptop and external to the left
5=Laptop with external monitor to the left, with big ass TV above
6=Go back to settings in (4) after choosing the big ass TV in (5)
9=External ONLY
x=run xrandr to find your settings, and exit
q=Do nothing and quit
==> ? " answer;

clear;

echo ""
echo "Run the script again to change your monitor resolution. Exiting..."
echo ""

case $answer in
	1)
		xrandr --output $monitor1 --auto --output $monitor2 --off --output $monitor3 --off;;

	2)
		xrandr --output $monitor1 --auto --output $monitor2 --auto --output $monitor3 --off;;

	3)
		xrandr --output $monitor1 --auto --output $monitor2 --auto --right-of $monitor1;;

	4)
		xrandr --output $monitor1 --auto --output $monitor2 --auto --left-of $monitor1 --output $monitor3 --off;;

	5)
		xrandr --output $monitor1 --auto --output $monitor2 --auto --left-of $monitor1 --output $monitor3 --auto --above $monitor1;;

	6)
		xrandr --output $monitor1 --auto --output $monitor2 --auto --left-of $monitor1 --output $monitor3 --off;;

	9)
		xrandr --output $monitor1 --off --output $monitor2 --auto;;

	x)
		echo " -- Here are your monitor resolution and device names -- ";
		echo " -- You can use this information to edit the script   -- ";
		echo ""
		xrandr | grep connected | grep -v disconnected;
		echo ""
		echo " -- Exiting ... ";;

	 q|Q)
		echo "Quitting..."
                exit;;

	*)
                echo "***>>> That's not one of the options, but you can run again for another try <<<***";;


esac




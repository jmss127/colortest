#!/bin/bash
# colortest.sh
# a script to test html color codes in the terminal
# with a sample text.

# take input of color code
# extract numbers convert to r g b values
# print sample text in rgb value color.

# TODO check if value is valid.

tput clear
reset="\e[m"
echo "Enter hex color code without the '#'"
echo -e "Press <CTRL+C> to exit\n"
while :
do    
    read -r -p "> " hexcode
    # make uppercase
    hexcode="$(echo $hexcode | tr '[:lower:]' '[:upper:]')"
    # cut hex values  
    x="$(echo $hexcode | cut -c-2)"
    y="$(echo $hexcode | cut -c3-4)"
    z="$(echo $hexcode | cut -c5-6)"
    # convert to rgb values
    r="$(echo "ibase=16; $x" | bc)"
    g="$(echo "ibase=16; $y" | bc)"
    b="$(echo "ibase=16; $z" | bc)"
    # assign rgb colors to $color
    color="\e[38;2;"$r";"$g";"$b"m"
    # print message
    echo -e "$color This is \#$hexcode rgb = $r $g $b. Calculating Magic Words..."
    # reset colors
    echo -e "$reset"
done
exit 0

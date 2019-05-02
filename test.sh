
#! /bin/bash
 
echo "-----------------the starting line of shell-----------------"
 
echo "please input the number for selecting country:
1. China
2. England
3. America
4. Russia
5. French
6. German"
 
value=0;
 
read -p "input: " value
 
case $value in
    1) echo "You select the China."
        ;;
    2) echo "You select the England"
        ;;
    3) echo "You select the America"
        ;;
    4) echo "You select the Russia"
        ;;
    5) echo "You select the French"
        ;;
    6) echo "You select the German"
        ;;
    *) echo "You select number is not in the menu"
        exit 1
        ;;
esac
 
echo "-----------------the ending line of shell-----------------"
--------------------- 

#!/bin/bash

GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
RESET=$(tput sgr0)
BLUE=$(tput setaf 4)

cat <<EOF
${GREEN}
*******************************************************************
*                                                                 *
*             _____  '                                            *
*            |  _  |    /\  /\__ _ _ __  __ _                     *
*            | | | |   / /_/ / _´ |  __\\/ _´ |                    *
*            | |_| |  / __  / (_| | |  | (_| |                    *
*            |_____| / / /_/ \__,_|_|   \__,_|                    *
*                                                                 *
*                                                                 *
* O'Hara 1.0                                                      *
* Coded by Herick Costa                                           *
* Information Gathering Business                                  *
*******************************************************************
${RESET}
EOF

if [ $# -ne 2 ];
then
echo "Usage: ./script browser target"
else

search="$1"
target="$2"
echo ""
echo "--------------------------------Google Searches--------------------------------"
echo ""
echo "Searching linkedin"
echo "Do you want to open the browser with the search? [Y/n]"
read resp
if [[ $resp =~ ^[Yy]$ || -z $resp ]]; then
$search "https://www.google.com/search?q=site:linkedin.com+$target" 2>/dev/null
fi
echo ""

echo "Seaching pastebin"
echo "Do you want to open the browser with the search? [Y/n]"
read resp  
if [[ $resp =~ ^[Yy]$ || -z $resp ]]; then
$search "https://google.com/search?q=site:pastebin.com+$target" 2>/dev/null
fi
echo ""

echo "Searching Trello"
echo "Do you want to open the browser with the search? [Y/n]"
read resp  
if [[ $resp =~ ^[Yy]$ || -z $resp ]]; then
$search "https://google.com/search?q=site:trello.com+$target" 2>/dev/null
fi
echo ""
echo ""

echo "--------------------------------Checking emails--------------------------------"
echo""
email=$(whois $2 | grep "e-mail" |cut -d ":" -f 2;
wget -q -O - $2 | grep -Eio "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b") 

for e in $email

do

echo "[+] email found: $e"
echo "Open leak search? [Y/n]"
read resp  
if [[ $resp =~ ^[Yy]$ || -z $resp ]]; then
$search "https://monitor.firefox.com/scan/#email=$e" 2>/dev/null

fi
done

fi

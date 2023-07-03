#!/bin/bash

YELLOW=$(tput setaf 3)
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
RESET=$(tput sgr0)
BLUE=$(tput setaf 4)

cat <<EOF
${RED}
*******************************************************************
*                                                                 *
*             _____  '                                            *
*            |  _  |    /\  /\__ _ _ __  __ _                     *
*            | | | |   / /_/ / _´ |  __\\/ _´ |                    *
*            | |_| |  / __  / (_| | |  | (_| |                    *
*            |_____| / / /_/ \__,_|_|   \__,_|                    *
*                                                                 *
*                                                                 *
* O'Hara 1.2                                                      *
* Coded by Herick Costa                                           *
* Information Gathering Web                                       *
*******************************************************************
${RESET}
EOF

if [ $# -ne 1 ];
 then
  echo ""
  echo "${RED}Usage: ./script target.com${RESET}"
  echo ""
else
 echo ""
 echo "${GREEN}--------------------------------Robots.txt/Sitemap.xml--------------------------------${RESET}"
 echo ""
 robots_txt=$(curl -H "User-Agent:Mozilla v.1.4.4" -s -L -o /dev/null -w "%{http_code}" "$1/robots.txt")

if [ "$robots_txt" == "200" ]; 
   then
    echo "${GREEN}[+]${RESET} Robots.txt: http://$1/robots.txt"
    curl -H "User-Agent:Mozilla v.1.4.4" -L "$1/robots.txt"
else
    echo "${YELLOW}[-]${RESET} Robots.txt:"
    echo "$robots_txt"
fi
echo ""
sitemap_xml=$(curl -H "User-Agent:Mozilla v.1.4.4" -s -L -o /dev/null -w "%{http_code}" "$1/sitemap.xml")

if [ "$robots_txt" == "200" ]; 
   then
    echo "${GREEN}[+]${RESET} Sitemap.xml:"
    echo "http://$1/sitemap.xml"
else
    echo "${YELLOW}[-]${RESET} Sitemap.xml:"
    echo "$sitemap_xml"
fi
 echo ""

 echo "${GREEN}--------------------------------Analyze Source Code--------------------------------${RESET}"
 echo ""

 page=$(wget -qO - $1)
 pageT=$(echo "$page" | grep '<title>')
 title="${pageT#*<title>}"
 title="${title%</title>*}"

 opt=$(curl -H "User-Agent:Mozilla v.1.4.4" -L -I -X OPTIONS -s $1 | grep "llow" | cut -d ":" -f 2)

 server=$(curl -H "User-Agent:Mozilla v.1.4.4" -L -I -s $1 | egrep "erver|PHP|php|powered|x-")

if [[ -n "$opt" ]]; 
   then
    echo "${GREEN}[+]${RESET} Accepted methods:"
    echo "$opt"
    echo ""
fi

if [[ -n "$title" ]]; 
   then
    echo "${GREEN}[+]${RESET} Page Title:"
    echo "$title"
    echo ""
fi

if [[ -n "$server" ]]; 
   then
    echo "${GREEN}[+]${RESET} Server Response Header:"
    echo "$server"
    echo ""
fi

echo "${GREEN}--------------------------------Brute force files and directories--------------------------------${RESET}"
echo ""
for i in $(cat wordlist.txt); 
   do
    response=$(curl -s -H "User-Agent:Mozilla v.1.4.4" -L -o /dev/null -w "%{http_code}" "$1/$i")
    if [ "$response" == "200" ]; 
       then
        echo "${GREEN}[+]${RESET} $1/$i"
    fi
done
echo ""
  echo "Do you want to test for files? [Y/n]"
   read resp
   if [[ $resp =~ ^[Yy]$ || -z $resp ]]; 
    then
     echo "Please enter the target URL: "
     read url
 echo ""
     echo "Please enter the file extension: (.ext)"
     read ext
 echo ""
      for i in $(cat wordlist.txt); 
         do
          response2=$(curl -s -H "User-Agent:Mozilla v.1.4.4" -L -o /dev/null -w "%{http_code}" "$url/$i$ext")
          if [ "$response2" == "200" ]; 
             then
              echo "${GREEN}[+]${RESET} $url/$i$ext"
          fi
      done
   fi

echo ""
echo ""
echo "Obs: ${GREEN}https://www.wappalyzer.com/${RESET} Identify technologies on websites"
echo "I recommend consulting ${GREEN}http://web.archive.org/${RESET} to search for the history of web pages"
fi


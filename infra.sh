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
* O'Hara 1.5                                                      *
* Coded by Herick Costa                                           *
* Information Gathering Infra                                     *
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
 echo "${GREEN}--------------------------------IP--------------------------------${RESET}"
 echo ""
  ip=$(host $1 | grep "address" | cut -d " " -f 4)
  echo "$ip"
 echo ""

 echo "${GREEN}--------------------------------Whois--------------------------------${RESET}"
  ip1=$(echo "$ip" | head -n 1)
  #ip2=$(echo "$ip" | sed -n '2p') #Uncomment to test 2º IP addresses
 echo ""
  whois $ip1 | grep "inetnum"
  whois $1 | grep -v "%"
 echo ""
  echo "For more information:"
  echo "[+] https://search.arin.net/rdap/?query=$ip1"
  #echo "[+] https://search.arin.net/rdap/?query=$ip2"     #Uncomment to test 2º IP addresses
 echo ""

 echo "${GREEN}--------------------------------Searching on BGP--------------------------------${RESET}"
 echo ""
  echo "[+] https://bgp.he.net/ip/$ip1"
  echo "[+] https://bgpview.io/ip/$ip1"
 echo ""
 echo "${GREEN}--------------------------------Searching on Shodan.io--------------------------------${RESET}"
 echo ""
  echo "[+] https://www.shodan.io/search?query=$1"
 echo ""
 echo "${GREEN}--------------------------------Searching on Censys.io--------------------------------${RESET}"
 echo ""
  echo "[+] https://search.censys.io/search?resource=hosts&sort=RELEVANCE&per_page=25&virtual_hosts=EXCLUDE&q=$1"
 echo ""
 echo "${GREEN}--------------------------------Trying zone transfer--------------------------------${RESET}"
 echo ""
  for server in $(host -t ns $1 | cut -d " " -f 4); 
  do
   echo "[+] Trying $server"
   echo ""
   result=$(host -l -a $1 $server 2>&1)
    if ! echo "$result" | grep -q "failed."; then
     echo "$result"
    else
     echo "No results found for $server"
    fi
 echo ""
  done

 echo "${GREEN}--------------------------------DNS brute force (direct)--------------------------------${RESET}"
  echo "${RED}Configure for your case* the code is commented.${RESET}"
 echo ""
 #Identify a pattern of return when it does not exist: host wrong.site.com ---> "NXDOMAIN"
 #Do not forget the wordlist.
 #wp="NXDOMAIN"          #Define the error pattern here.
  #for w in $(cat wordlist.txt);
  #do
   #host $w.$1 ;
  #done | grep -v $wp
 #echo ""

 echo "${GREEN}--------------------------------DNS brute force (indirect/reverse)--------------------------------${RESET}"
 echo "${RED}Configure for your case* the code is commented.${RESET}"
 echo ""
 #ip_ad=$(echo "$ip1" | cut -d "." -f 1-3)
 #ip_ad2=$(echo "$ip2" | cut -d "." -f 1-3)        #Uncomment to test 2º IP addresses
 #echo $ip_ad
 #rangeip="224 239"         #Fix the IP range here (it may appear in 'inetnum').
 #for i in $(seq $rangeip);
 #do
  #result=$(host $ip_ad.$i)
  #result=$(host $ip_ad2.$i)        #Uncomment to test 2º IP addresses
  #echo "[+] "$result
 #done | grep -v $wp
 echo "${GREEN}--------------------------------Research on VirusTotal--------------------------------${RESET}"
  url="http://$1/"
  sha256=$(echo -n $url | sha256sum)
 echo ""
  echo "[+] https://www.virustotal.com/gui/url/$sha256"
 echo ""
 echo "${GREEN}--------------------------------Research on DNSDumpster--------------------------------${RESET}"
 echo ""
  echo "[+] https://dnsdumpster.com/"
 echo ""
 echo "${GREEN}--------------------------------Research on SecurityTrails--------------------------------${RESET}"
 echo ""
  echo "[+] https://securitytrails.com/domain/$1/dns"
 echo ""
 echo "${GREEN}--------------------------------SPF (Sender Policy Framework) research--------------------------------${RESET}"
 echo ""
  host -t txt $1
 echo ""
  echo "?all --> susceptible*"
  echo "~all --> susceptible*"
  echo "-all --> not susceptible"
 echo ""
 echo "${GREEN}--------------------------------Subdomain takeover research--------------------------------${RESET}"
 echo ""
  found=false
  for i in $(cat wordlist.txt); 
  do
   output=$(host -t cname $i.$1 | grep "alias for")
    if ! [[ -z $output ]]; 
    then
     echo "$output"
     found=true
    fi
  done
  if [[ $found == false ]]; then
   echo "Not found"
  fi
 echo ""
  echo "Is the address active?"
  echo " yes ---> not vulnerable"
  echo " no ---> can it be registered?"
  echo "     no ---> not vulnerable"
  echo "     yes ---> vulnerable"

fi

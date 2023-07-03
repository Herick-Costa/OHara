# O'Hara Information Gathering

## Description

The O'Hara project is a collection of Bash scripts developed for the Information Gathering phase in various environments. It aims to facilitate the collection of relevant information by providing search results and information verification from multiple sources.

## Installation

1. Clone this repository to your local machine.
2. Make sure you have Bash installed on your system.
3. Execute the file with execution privileges.

## business.sh

This Bash script is focused on the Information Gathering phase in a business context. It collects relevant information by performing searches on Google, checking LinkedIn, Pastebin, Trello, and scanning emails for possible leaks. The script prompts the user to open the search results in a browser for further investigation.

To use the script, provide two arguments: the browser command and the target (./business.sh firefox site.com). The script will perform the specified searches and display the results.

## infra.sh

This Bash script is focused on the Information Gathering phase in infrastructure. It displays information about the provided target, such as IP address, Whois details, BGP search, Shodan.io, Censys.io, and attempts at DNS zone transfer. Additionally, the code includes a DNS brute force search, both forward and reverse, searches on VirusTotal, DNSDumpster, and SecurityTrails, and also searches for subdomain vulnerabilities.

The purpose of this code is to assist in obtaining relevant information during the Information Gathering phase. It provides a variety of resources to search and verify information from various available sources.

Note: Some parts of the code are commented out and require specific configuration to work correctly, such as customizing the DNS error pattern, selecting a wordlist for DNS brute force, and other case-specific configurations.

## web.sh

This Bash script is focused on the Information Gathering phase on web pages. It performs various tasks such as obtaining the content of the "robots.txt" and "sitemap.xml" files, analyzing the page source code, identifying accepted methods, and displaying server response headers. Additionally, the script performs a brute force of files and directories.

## Legal Disclaimer

These scripts are intended for educational and ethical purposes only. Misuse of these scripts in any illegal activity is strictly prohibited. The author is not responsible for any misuse or illegal use of these scripts.

## Contribution

Feel free to contribute by suggesting improvements, bug fixes, or adding new features to the script. Simply submit a pull request in this repository.

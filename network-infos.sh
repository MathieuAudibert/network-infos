#!/bin/bash
get_continent() {
    ip=$1
    continent=$(curl -s https://ipinfo.io/$ip | grep country | awk -F '"''{print $4}')
    case$continentin"AS")
            continent_name="Asie"
            ;;
        "EU")
            continent_name="Europe"
            ;;
        "AF")
            continent_name="Afrique"
            ;;
        "NA")
            continent_name="Amerique du Nord"
            ;;
        "SA")
            continent_name="Amerique du Sud"
            ;;
        "OC")
            continent_name="Oceanie"
            ;;
        "AN")
            continent_name="Antarctique"
            ;;
        *)
            continent_name="Inconnue"
            ;;
    esacecho$continent_name
}

scan_network() {
    echo"Scanning the network..."
    nmap -sn 192.168.0.0/24 > results.txt
}

display_info() {
    echo"Network infos"echo -e "Made by MathieuA              \\             / /"echo -e "                          \\\\\\', ,      / //"echo -e "                           \\\\\\//,   _/ //,"echo -e "                            \\_-//' /  //<,"echo -e "                              \\ ///  >  \\\`__/_"echo -e "                              /,)-^>> _\` \\\\"echo -e "                              (/   \\\\ //\\\\"echo -e "                                  // _//\\\\\\\\"echo -e "                                ((\` (( "echo"--------------------"
    whileread line; doif [[ $line == *"Nmap scan report for"* ]]; then
            ip=$(echo$line | awk '{print $5}')
            ip_type="IPv4"if [[ $ip == *":"* ]]; then
                ip_type="IPv6"fi
            continent=$(get_continent $ip)
            echo"Network: 192.168.x.x"echo"IP: $ip"echo"IP Type: $ip_type"echo"Continent: $continent"echo"--------------------"fidone < results.txt
}

scan_network
display_info

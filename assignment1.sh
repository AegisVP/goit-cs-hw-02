#!/bin/bash

# setting variables
websites=( "https://google.com" "https://facebook.com" "https://www.twitter.com" )
logfile="websites.log"

# resetting log file
echo '' > "$logfile"

# checking websites
for website in "${websites[@]}"
do
    if curl -s -L --head --request GET -w "%{http_code}\n" "$website" | grep -q "200";
    then
        echo "$website is UP"  >> "$logfile"
    else
        echo "$website is DOWN" >> "$logfile"
    fi
done

#finishing
echo "Results written to $logfile"
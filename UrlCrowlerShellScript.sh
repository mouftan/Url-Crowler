#!/bin/bash


echo " _      ____  _     _____ _____  ____  _     
/ \__/|/  _ \/ \ /\/    //__ __\/  _ \/ \  /|
| |\/||| / \|| | |||  __\  / \  | / \|| |\ ||
| |  ||| \_/|| \_/|| |     | |  | |-||| | \||
\_/  \|\____/\____/\_/     \_/  \_/ \|\_/  \|
                                             "


echo "Loading this Shit now ..."                                            

UrlList="$1"
proxy_host="IP"
proxy_port="PORT"
timeout_seconds=10
Agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36"

if [ -z "$UrlList" ]; then
  echo "No List?..."
  exit 1
fi

while IFS=$' \t\r\n' read -r url; do
  echo "GET request to: $url"
  curl -x "$proxy_host:$proxy_port" -k --max-time "$timeout_seconds" "$url" -A "$Agent"
  echo "POST request to: $url"
  curl -x "$proxy_host:$proxy_port" -k --max-time "$timeout_seconds" -X POST "$url" -A "$Agent"
  echo "PUT request to: $url"
  curl -x "$proxy_host:$proxy_port" -k --max-time "$timeout_seconds" -X PUT "$url" -A "$Agent"
  echo "OPTIONS request to: $url"
  curl -x "$proxy_host:$proxy_port" -k --max-time "$timeout_seconds" -X OPTIONS "$url" -A "$Agent"
  echo "Next ..."
done < "$UrlList"

#!/bin/bash

figlet RDP Socat Tunneling

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $SCRIPT_DIR/load-env.sh

IFS=',' read -r -a array <<< "$SOCAT_RDP_REMOTES"
pkill -f socat
for index in "${!array[@]}"
do
    port=$((5000 + $index))
    socat tcp-listen:$port,reuseaddr,fork tcp:${array[index]} &
done
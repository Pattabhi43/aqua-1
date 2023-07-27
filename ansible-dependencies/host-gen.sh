#!/bin/bash

ansible-inventory --list|grep -o '"private_ip_address": "[^"]*'|awk -F': "' '{print $2}'|sort|uniq > hosts.txt
hosts_file="hosts.txt"
inventory_file="inventory.ini"

if [ -f "$hosts_file" ]; then
    echo "[slaves]" > "$inventory_file"

    while IFS= read -r host
    do
        echo "$host" >> "$inventory_file"
    done < "$hosts_file"

    echo "Inventory file: $inventory_file"
else
    echo "Hosts file not found: $hosts_file"
fi
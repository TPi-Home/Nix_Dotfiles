#!/usr/bin/env bash

sudo systemd-analyze security | grep -E '(\.service|UNIT)'

read -p "Enter the systemd service to inspect (e.g., sshd, nginx): " service_name

if [ -z "$service_name" ]; then
    echo "Error: No service name provided. Exiting."
    exit 1
fi

service_name="${service_name%.service}"

echo -e "\nAnalyzing security for: ${service_name}.service...\n"

systemd-analyze security --no-pager "${service_name}.service"

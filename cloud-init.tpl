#!/usr/bin/env bash
sudo apt update && sudo apt install -y unzip jq boinc-client dnsutils
sleep 12
systemctl restart boinc-client
sleep 12
sudo boinccmd --project_attach http://setiathome.berkeley.edu "${bionc_project_id}"
sleep 12
systemctl restart boinc-client

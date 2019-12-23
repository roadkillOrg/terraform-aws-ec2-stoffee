#!/bin/bash
sudo apt update && sudo apt install -y unzip jq boinc-client dnsutils
sudo boinccmd --project_attach http://setiathome.berkeley.edu 51f200480b1473b1b972f89b051a31d3
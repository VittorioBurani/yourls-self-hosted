#!/bin/sh

# Define paths:
PLUGIN_FOLDER=user/plugins
PAGES_FOLDER=user/pages
SLEEKY_BACKEND_FOLDER=sleeky-backend
NOT_FOUND_FOLDER='404-if-not-found'
ALWAYS_302_FOLDER=always-302
IP_VIEWER_FOLDER=ip-viewer
LINKLIST_FOLDER=yourls-linklist

# Create plugin folders:
mkdir -p $PAGES_FOLDER
mkdir -p "${PLUGIN_FOLDER}/${NOT_FOUND_FOLDER}"
mkdir -p "${PLUGIN_FOLDER}/${ALWAYS_302_FOLDER}"
mkdir -p "${PLUGIN_FOLDER}/${IP_VIEWER_FOLDER}"

# Download plugins through wget and unpack through xz-utils:
echo "Installing Sleeky Theme Backend..."
wget -O - https://api.github.com/repos/Flynntes/Sleeky/tarball/v2.5.0 | tar -xz --strip=1 -C /tmp
mv "/tmp/${SLEEKY_BACKEND_FOLDER}" "${PLUGIN_FOLDER}/${SLEEKY_BACKEND_FOLDER}" && rm -r /tmp/sleeky-frontend && rm /tmp/*

echo "Installing 404-if-not-found..."
wget -O - https://api.github.com/repos/YOURLS/404-if-not-found/tarball/1.1 | tar -xz --strip=1 -C "${PLUGIN_FOLDER}/${NOT_FOUND_FOLDER}"

echo "Installing Always-302..."
wget -O - https://api.github.com/repos/tinjaw/Always-302/tarball/master | tar -xz --strip=1 -C "${PLUGIN_FOLDER}/${ALWAYS_302_FOLDER}"

echo "Installing Yourls-Ip-Viewer..."
wget -O - https://api.github.com/repos/faab007nl/Yourls-Ip-Viewer/tarball/main | tar -xz --strip=1 -C "${PLUGIN_FOLDER}/${IP_VIEWER_FOLDER}"

# Check through passed argument if linklist have to be passed:
if [ $1 -eq 1 ]; then
    echo "Installing yourls-linklist"
    wget -O - https://api.github.com/repos/VittorioBurani/yourls-linklist/tarball/master | tar -xz --strip=1 -C "/tmp"
    mv /tmp/index.php . && mv /tmp/linkslist.inc.php $PAGES_FOLDER  && rm -r /tmp/list-links && rm /tmp/*
fi

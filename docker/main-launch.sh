#!/bin/bash

# main-launch.sh
# Script run in the main container
# If this script exits, so does the main container

sudo npm cache clean --force 

sudo chown -R 1001:121 "/root/.npm"

# Rebuild to replace mapped directory build
npm run build

pm2 start manifest.json --only web

# We shall now display logs indefinitely
pm2 logs

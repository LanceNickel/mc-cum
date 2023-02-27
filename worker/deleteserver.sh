#!/usr/bin/env bash

### [DELETE WORKER] ###############################################
#   Description:  Worker script that deletes a server directory.
#   Parameters:   1: (required) Server directory name

############################ [WARNING] ############################
##    No part of this script is designed to be user-editable.    ##
##   This script is OVERWRITTEN any time a Gorp update is run.   ##
###################################################################



# PERMISSIONS GUARD

if [[ "$EUID" != 0 ]]; then
        echo "delete.sh: Insufficient privilege. Exiting."
        exit
fi



# SCRIPT VARIABLES

SERVER=$1



####



# USER CONFIRMATION GUARD

echo "You are going to DELETE a server. There is no way back."

read -r -p "Did you back up the server? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sleep 0.25
else
    echo "PLEASE BACK UP YOUR WORLD FILES! Run 'mcbackup $SERVER' to take a back up first."
    exit
fi

read -r -p "Enter '$SERVER' to confirm: " response
if [[ "$response" == "$SERVER" ]]; then
    sleep 0.5
else
    echo "Incorrect response. Exiting."
    exit
fi



# DELETE SERVER

echo "delete.sh: Deleting server..."

rm -rf $HOMEDIR/servers/$SERVER



echo "delete.sh: Server deleted."
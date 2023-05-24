# This Bash script checks if the certificate and key files exist in the specified directory. If they do, it removes them.

#!/bin/bash

# Remove the certificate and key files if they exist
if [ -f ~/inception/srcs/requirements/tools/mikuiper.42.fr.crt ]; then
    rm ~/inception/srcs/requirements/tools/mikuiper.42.fr.crt
fi
if [ -f ~/inception/srcs/requirements/tools/mikuiper.42.fr.key ]; then
    rm ~/inception/srcs/requirements/tools/mikuiper.42.fr.key
fi

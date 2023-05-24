# This Bash script checks if mkcert is installed and installs it if it's not found. It then changes the local domain by adding an entry to the /etc/hosts file. The script installs the mkcert root CA by running mkcert -install. It creates a key and certificate for the domain mikuiper.42.fr using mkcert. The key and certificate files are renamed and copied to the Nginx folder. Finally, a message is printed indicating that the script has completed.

#!/bin/bash

# Check if mkcert is installed
if ! command -v mkcert &> /dev/null
then
    echo "mkcert not found. Installing..."
    sudo apt-get update
    sudo apt-get install -y wget curl libnss3-tools
    curl -sLO "https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64"
    chmod +x mkcert-v1.4.3-linux-amd64
    sudo mv mkcert-v1.4.3-linux-amd64 /usr/local/bin/mkcert
fi

# Change local domain
if ! grep -q "mikuiper.42.fr" /etc/hosts
then
    echo "Adding mikuiper.42.fr to /etc/hosts..."
    echo "127.0.0.1   mikuiper.42.fr" | sudo tee -a /etc/hosts > /dev/null
fi

mkcert -install

# Create key + certificate
echo "Creating key and certificate..."
cd ~/inception/srcs/requirements/tools
mkcert mikuiper.42.fr

# Change key + certificate in desired formats
echo "Renaming key and certificate files..."
mv mikuiper.42.fr-key.pem mikuiper.42.fr.key
mv mikuiper.42.fr.pem mikuiper.42.fr.crt

# Copy the key + certificate to nginx folder
echo "Copying key and certificate to nginx folder..."
if [ -f ~/inception/srcs/requirements/nginx/tools/mikuiper.42.fr.key ]; then
    rm ~/inception/srcs/requirements/nginx/tools/mikuiper.42.fr.key
fi
if [ -f ~/inception/srcs/requirements/nginx/tools/mikuiper.42.fr.crt ]; then
    rm ~/inception/srcs/requirements/nginx/tools/mikuiper.42.fr.crt
fi
cp mikuiper.42.fr.key mikuiper.42.fr.crt ~/inception/srcs/requirements/nginx/tools/

echo "Done!"

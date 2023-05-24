cd ~/inception/srcs/requirements/tools/ ;

# Clean up
rm -f /home/$USER/inception/srcs/requirements/tools/* ;
rm -f /home/$USER/inception/srcs/requirements/nginx/tools/* ;

# mkcert
sudo apt install -y wget curl libnss3-tools ;
curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64" ;
chmod +x mkcert-v*-linux-amd64 ;
sudo cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert ;

# Create key + certificate
mkcert mikuiper.42.fr ;

# Change key + certificate in desired formats
mv mikuiper.42.fr-key.pem mikuiper.42.fr.key ;
mv mikuiper.42.fr.pem mikuiper.42.fr.crt ;

# Copy the key + certificate to nginx folder
cp /home/$USER/inception/srcs/requirements/tools/* /home/$USER/inception/srcs/requirements/nginx/tools/ ;

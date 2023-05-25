# Dockerfile for setting up Nginx with SSL support and a self-signed certificate in a Debian Buster-based image.

# The base image is set to debian:buster.
# The necessary packages (nginx, openssl, curl, libfcgi0ldbl) are installed.
# The nginx.conf file is copied to the appropriate location in the container.
# The start_nginx.sh script is copied to the container.
# Permissions are granted to the start_nginx.sh script to make it executable.
# A symlink is created to enable the default Nginx configuration.
# A self-signed SSL certificate is generated using OpenSSL.
# Port 443 is exposed for HTTPS access.
# The entrypoint is set to run the start_nginx.sh script.

# When generating a self-signed certificate or a certificate for internal use,
# you can set the Common Name field to the domain or hostname you want to use
# for your website or server. In the provided Dockerfile, the Common Name is set
# to "mikuiper.42.fr" using the -subj flag in the OpenSSL command.

# Base image
FROM debian:buster

# Update packages and install necessary dependencies
RUN apt-get update
RUN apt-get install -y nginx openssl curl
RUN apt-get -y install libfcgi0ldbl

# Copy nginx configuration file
COPY conf/nginx.conf /etc/nginx/sites-available/default.conf

# Copy start_nginx.sh
COPY start_nginx.sh .

# Make start_nginx.sh executable
RUN chmod +x start_nginx.sh

# Create symlink for nginx configuration
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

# Generate self-signed SSL certificate
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/key.key -out /etc/nginx/crt.crt -subj "/CN=mikuiper.42.fr" # Common Name

# Expose port 443 for HTTPS access
EXPOSE 443

# Set entrypoint to run start_nginx.sh
ENTRYPOINT [ "./start_nginx.sh" ]

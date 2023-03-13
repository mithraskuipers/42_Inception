# Use the Debian Buster base image
FROM debian:buster

# Update package list and install Nginx and OpenSSL
RUN apt-get update && apt-get install -y \
	nginx \
	openssl && \
	rm -rf /var/lib/apt/lists/* # Clean up package cache to reduce image size

# Copy Nginx configuration file to the container
COPY ./cfg/nginx.conf /etc/nginx/sites-available/default

# Generate self-signed SSL certificate and key for HTTPS
RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt -sha256 -subj "/CN=mikuiper.42.fr"

# Start Nginx with the "daemon off" option to prevent it from running as a background process
CMD ["nginx", "-g", "daemon off;"]

# This Dockerfile starts with a base image of Alpine version 3.16. It then proceeds to update the list of repositories and install Nginx without saving the sources in the cache. The Dockerfile exposes port 443 to allow incoming connections. Finally, it sets the command to run the Nginx configuration file, using the "daemon off;" directive to keep the process running in the foreground.

FROM    alpine:3.16
# Update list of repositories and install nginx without saving the sources in the cache
RUN     apk update && apk upgrade && apk add --no-cache nginx
# Open the port that will be used by the container
EXPOSE 443
# Run the configuration file
CMD ["nginx", "-g", "daemon off;"]

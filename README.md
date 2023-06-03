<p align="center" style="margin-bottom: 0px !important;">
  <img width="600" src="https://github.com/mithraskuipers/mithraskuipers/blob/master/readme_srcs/42/logo.png?raw=true" alt="42_Network_Amsterdam" align="center"> </p>
<h1 align="center" style="margin-top: 0px;">Inception <a href="https://github.com/JaeSeoKim/badge42"><img src="https://badge42.vercel.app/api/v2/cl483ajsd008309l6suq9l256/project/3033162" alt="mikuiper's 42 Inception Score" /></a></h1>

<p align="center" style="margin-top: 0px;">
<img src="https://forthebadge.com/images/badges/made-with-c.svg"/>
<img src="https://forthebadge.com/images/badges/built-with-love.svg"/>
</p>

# Inception

A System Administration Exercise on Docker Implementation

## Project Description
This project focuses on system administration using Docker. The primary objective is to create a WordPress website hosted by NGINX and utilizing a MariaDB database.

### Project Requirements:
- Utilize separate Docker containers for WordPress, NGINX, and MariaDB, establishing communication among them through a unified Docker network.
- Create two volumes: one for the MariaDB database and another for the WordPress website files.
- Develop customized Dockerfiles for each service.
- Configure all images, networks, and volumes using a single docker-compose.yml file.
- The project must be executed on a Virtual Machine.

### Desired implementation structure diagram


<div style="text-align: center;">
<img src="https://user-images.githubusercontent.com/54292953/147146268-a616f39a-3f16-41f8-80c9-db5494c3dfe7.png?raw=true" width="900px" alt="diagram of required structure"/>
</div>

## Quick rundown of the concepts

The following section provides comprehensive explanations and definitions of the concepts introduced in this project.

## Docker

Docker is a powerful platform for app development that simplifies the process of shipping and running applications. It provides a magical separation between apps and the underlying infrastructure, making it incredibly easy to manage.

By leveraging the wizardry of containers, Docker neatly packages all the essential components of an app—dependencies, libraries, config files—into a single entity. These containers share the resources of the operating system, and Docker images bring all the necessary tools to execute the app's code.

## Docker Compose

Say hello to Docker Compose, the maestro of multi-container management. With just a single command, it orchestrates the complex dance of your applications. Thanks to its YAML prowess using the `docker-compose.yml` file, you can effortlessly configure and deploy your app ensemble.

Docker Compose is all about efficiency and simplicity. No more manual headaches or error-prone setups. It gracefully handles multiple images, volumes, and networks, streamlining your deployment process and making it a walk in the park.

### Docker vs Virtual Machines

|             | Docker                                                                               | Virtual Machines                                                                            |
|-------------|--------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| OS          | Shares the operating system with the host, resulting in lower resource consumption.  | Emulates virtual hardware and has its own operating system, leading to higher resource usage. |
| Performance | Utilizes fewer resources, thus achieving higher performance.                         | Requires more resources, leading to comparatively lower performance.                         |
| Portability | Offers portability as it does not have its own operating system, facilitating access.| Limited to the host device and lacks portability.                                           |
| Security    | Ensures container isolation from the host and other containers.                      | Provides isolation between VMs and the host.                                               |
| Scalability | Allows easy scaling by adding or removing containers.                                | Scaling involves creating new VM instances, which can be more complex.                       |
| Maintenance | Enables individual container updates without affecting others.                            | Updating a VM requires updating the entire VM instance.                                     |
| Cost        | Free                                                                                 | Can be costly to maintain.                                                                 |

### Network

A Docker network is like a virtual party where containers can mingle and communicate. It sets the stage for secure and controlled interactions, keeping things organized and drama-free.

In this project, Docker networks bring together the WordPress website, MariaDB database, and NGINX web server, allowing them to collaborate and share data seamlessly. It's the networking magic that makes everything click.

### Volumes

Think of Docker volumes as handy storage lockers for your containers. They keep your important stuff safe and accessible, even when containers need to take a break and restart.
In this project, volumes are the unsung heroes that ensure the WordPress website and MariaDB database have a safe place to keep their data. From images and videos to user info and other files, volumes make sure nothing gets lost in the shuffle.
mes are directories on the host system that are mapped to directories within containers. They enable persistent storage and data sharing between container restarts. In this project, volumes are essential for the WordPress website and MariaDB database to store data such as images, videos, user information, and other files. Without volumes, data would be lost when containers are restarted.

### NGINX

NGINX is a powerful web server known for its speed, versatility, and reliability. It not only serves your website but also excels at handling tasks like reverse proxying, load balancing, and content caching. With NGINX, you can ensure that your website performs optimally and delivers a seamless experience to your visitors.

### MariaDB

Meet MariaDB, a reliable and sophisticated database management system. It is a community-driven alternative to MySQL, offering stability and flexibility for your data storage needs. Whether you're running an e-commerce platform, a logging application, or any other data-intensive system, MariaDB provides the foundation for efficient and secure data management.

### WordPress

WordPress is a popular and user-friendly content management system (CMS) that simplifies website creation and management. It eliminates the need for extensive coding knowledge, allowing you to focus on content creation and customization. With its vast ecosystem of plugins and customizable templates, WordPress empowers you to build a unique and engaging website for various purposes, such as blogs, online stores, and more.

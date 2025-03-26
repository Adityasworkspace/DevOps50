# Docker Setup and Commands
## This guide outlines the steps for installing and managing Docker on your system. Follow the commands step by step to set up Docker, pull images, and manage containers.

1. Update System and Install Docker
Ensure your system is up to date and install Docker.

```bash
sudo yum update -y
sudo yum install docker -y
```

2. Check Docker Version
Verify that Docker has been installed successfully.
```bash
docker --version
```

3. Start and Enable Docker Service
Start the Docker service and enable it to start automatically on boot.

```bash
sudo systemctl start docker
sudo systemctl enable docker
```

4. Check Running Docker Containers
View the list of containers that are currently running.

```bash
docker ps
```

5. Add User to Docker Group
Add the ec2-user (or your user) to the Docker group to allow running Docker commands without sudo.

```bash
sudo usermod -aG docker ec2-user
newgrp docker
```

6. Pull Docker Image (Nginx)
Download the official Nginx image from Docker Hub.

```bash
docker pull nginx
```

7. List Docker Images
View all images available on your system.

```bash
docker images
```

8. List All Docker Containers
Display all containers, both running and stopped.

```bash
docker ps -a
```
9. Inspect a Container
Get detailed information about a specific container (replace <containerID> with the container's actual ID).

```bash
docker inspect <containerID>
```

10. View Container Logs
View the logs of a specific container (replace enginx with the container name or ID).

```bash
docker logs <container ID/name>
```

11. Login to a Running Container
Access the container's shell for interactive use (replace enginx with the container name or ID).

```bash
docker exec -it <container ID/name> /bin/bash
```

12. Test Nginx Server (Inside the Container)
Use curl to test the Nginx server on the container.

```bash
curl localhost
```

13. Exit the Container
Exit the bash session inside the container.

```bash
exit
```

14. Remove a Running Container
Force remove a running container (replace enginx with the container name or ID).

```bash
docker rm -f <container ID/name>
```

15. Remove a Docker Image
Force remove a Docker image (replace nginx with the image name or ID).

```bash
docker rmi -f <imageID/name>
```

docker create -d --name cont- 80:80 nginx

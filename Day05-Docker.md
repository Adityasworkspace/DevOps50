# ![Docker Logo](https://www.docker.com/wp-content/uploads/2022/03/vertical-logo-monochromatic.png)

# 🚀 Day 5: Learning Docker Basics

Docker is a **containerization platform** that allows applications to run in isolated environments. Below are the basics of Docker that I learned today.

---

## 📌 1. What is Docker?
Docker helps in packaging applications along with their dependencies, ensuring they work the same across different environments.

### ✅ **Why use Docker?**
- Works consistently across different environments
- Uses fewer resources than Virtual Machines
- Faster deployments
- Easy to scale

---

## 📌 2. Docker Architecture: Client, Host, and Registry

### 🔹 Docker Client
- The **Docker Client** is the interface that allows users to interact with Docker.
- Commands like `docker run`, `docker pull`, and `docker build` are executed via the Docker Client.
- The Client communicates with the **Docker Daemon** running on the **Docker Host**.

### 🔹 Docker Host
- The **Docker Host** is the machine that runs the **Docker Daemon**.
- It manages containers, images, networks, and storage.
- The Host provides the necessary environment for running Docker containers.

### 🔹 Docker Registry
- The **Docker Registry** is a repository that stores Docker images.
- Public registries like **Docker Hub** provide access to many prebuilt images.
- Private registries can be set up for storing custom images securely.

**Docker Workflow:**
1. The Docker Client requests an image from the Registry.
2. The Docker Host pulls the image from the Registry.
3. The Docker Host runs the image as a container.


![image](https://github.com/user-attachments/assets/7637eee1-56af-4f43-b728-93a2559d7a19)


---

## 📌 3. Difference Between Monolithic and Microservices Architecture

| Feature               | Monolithic Architecture                                | Microservices Architecture                            |
|-----------------------|------------------------------------------------|------------------------------------------------|
| **Structure**        | Single, tightly integrated application           | Collection of small, independent services      |
| **Scalability**      | Difficult to scale specific components           | Easily scalable as each service scales independently |
| **Deployment**      | Entire application must be deployed together     | Each service can be deployed independently    |
| **Technology Stack** | Uses a single technology stack                   | Allows multiple technologies per service     |
| **Fault Isolation**  | Failure in one part can affect the whole system  | Failures are isolated to individual services |
| **Development Speed** | Faster for small applications                    | Better for large, complex applications       |
| **Maintenance**      | Harder as the application grows                   | Easier as components are separate and modular |

---

## 📌 4. Difference Between Virtual Machines and Docker Containers

| Feature               | Virtual Machines (VMs)                            | Docker Containers                              |
|-----------------------|------------------------------------------------|------------------------------------------------|
| **Isolation**        | Fully isolated OS for each VM                   | Shares OS kernel, lightweight containers      |
| **Startup Time**     | Takes minutes to boot                            | Starts in seconds                             |
| **Resource Usage**   | Heavy, requires more RAM & CPU                   | Lightweight, uses less RAM & CPU              |
| **Storage**         | Requires full OS installation                     | Shares host OS, minimal storage               |
| **Deployment**      | Slower, requires full OS boot                     | Fast, can be deployed instantly               |
| **Portability**     | Less portable due to OS dependency                | Highly portable across different environments |
| **Management**      | Managed via Hypervisor                            | Managed via Docker Engine                     |
| **Scaling**        | Harder, requires more resources                    | Easier, uses fewer resources                  |

---

## 📌 5. Installing Docker
For Linux (Ubuntu/Debian), run:
```bash
sudo apt update
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
```
To check the installation:
```bash
docker --version
```

---

## 📌 6. Basic Docker Commands

### 🔹 Check Docker Version
```bash
docker --version
```

### 🔹 Run a Test Container
```bash
docker run hello-world
```

### 🔹 List Running Containers
```bash
docker ps
```

### 🔹 List All Containers (Running + Stopped)
```bash
docker ps -a
```

### 🔹 Download an Image from Docker Hub
```bash
docker pull ubuntu
```

### 🔹 Run a Container in Interactive Mode
```bash
docker run -it ubuntu bash
```

### 🔹 Start & Stop Containers
```bash
docker start <container-id>
docker stop <container-id>
```

### 🔹 Remove a Container
```bash
docker rm <container-id>
```

### 🔹 Remove an Image
```bash
docker rmi <image-id>
```

---

## 📌 7. Creating a Custom Docker Image
### **🔹 Steps to Build an Image**
1. **Create a `Dockerfile`**
```dockerfile
# Use Ubuntu as the base image
FROM ubuntu:latest
# Install a package inside the container
RUN apt update && apt install -y nginx
# Set the default command
CMD ["nginx", "-g", "daemon off;"]
```

2. **Build the Image**
```bash
docker build -t my-nginx .
```

3. **Run the Container**
```bash
docker run -d -p 8080:80 my-nginx
```

Now, visit **`http://localhost:8080`** to see your container running! 🚀

---

## **📌 8. Uploading This Learning to GitHub**
```bash
git add README.md
git commit -m "Day 5: Learning Docker basics"
git push origin main
```

---

🚀 **Now my Docker learning is uploaded to GitHub!** 🎉  
This marks my **Day 5 of DevOps learning.** 😊






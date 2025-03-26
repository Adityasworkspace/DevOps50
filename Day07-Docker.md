# ![Docker Logo](https://www.docker.com/wp-content/uploads/2022/03/vertical-logo-monochromatic.png)

# 🚀 Day 7: Docker Networking Guide

## **1️⃣ Introduction to Docker Networks**
Docker provides different networking modes that allow containers to communicate with each other and external systems.

## **2️⃣ Types of Docker Networks**

| Network Type  | Description |
|--------------|-------------|
| **Bridge (default)** | Used for container-to-container communication on a single host. |
| **Host** | The container shares the host’s network. |
| **None** | The container has no network access. |
| **Overlay** | Used in **Swarm Mode** for multi-host networking. |
| **Macvlan** | Assigns a MAC address, making the container look like a physical device. |

Check available networks:
```bash
docker network ls
```

## **3️⃣ Creating & Managing Networks**

### **Create a Custom Bridge Network**
```bash
docker network create dnet
```
This creates an isolated network for your containers.

Verify:
```bash
docker network ls
```
Inspect details:
```bash
docker network inspect dnet
```

## **4️⃣ Running Containers in a Network**
Run two Nginx containers in the same network:
```bash
docker run -d --name c1 --network ubuntu
docker run -d --name c2 --network ubuntu
```
Now, `c1` and `c2` can talk to each other using container names:
```bash
docker exec -it c1 ping c2
```

## **5️⃣ Connecting & Disconnecting Containers**

### **Attach an Existing Container to a Network**
```bash
docker network connect dnet c1
```

### **Disconnect a Container from a Network**
```bash
docker network disconnect dnet c1
```

## **6️⃣ Inspecting & Removing Networks**

### **Inspect Network Details**
```bash
docker network inspect dnet
```

### **Remove a Network**
```bash
docker network rm dnet
```
(*Cannot remove if containers are still connected!*)

## **7️⃣ Docker Network Diagram**
![image](https://github.com/user-attachments/assets/85478112-d874-4602-b8f4-407d51bda90a)



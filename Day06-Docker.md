# ![Docker Logo](https://www.docker.com/wp-content/uploads/2022/03/vertical-logo-monochromatic.png)

# 🚀 Day 6: Setting Up Nginx on AWS Ubuntu Instance

## **1️⃣ Create an Ubuntu Instance on AWS**
1. Log in to your **AWS Management Console**.
2. Go to **EC2 Dashboard** > **Launch Instance**.
3. Select **Ubuntu 22.04 LTS** as the AMI.
4. Choose an instance type (e.g., **t2.micro** for free-tier).
5. Configure security groups:
   - Allow **SSH (port 22)** for remote access.
   - Allow **HTTP (port 80)** and **HTTPS (port 443)** for web access.
6. Launch the instance and **connect via SSH**:
   ```bash
   ssh -i your-key.pem ubuntu@your-instance-ip
   ```

---

## **2️⃣ Install Docker on Ubuntu Instance**
Run the following command to install Docker:
```bash
sudo apt update
sudo apt install docker.io -y
```
Verify the installation:
```bash
docker --version
```
Start and enable Docker service:
```bash
sudo systemctl start docker
sudo systemctl enable docker
```

---

## **3️⃣ Pull the Nginx Image from Docker Hub**
Download the latest Nginx image:
```bash
docker pull nginx
```
To pull a specific version (e.g., Nginx 1.21), use:
```bash
docker pull nginx:1.21
```

---

## **4️⃣ Run the Nginx Container**
Start an Nginx container and expose it on port **80**:
```bash
docker run -d -p 80:80 --name my_nginx nginx
```
- `-d` → Runs the container in detached mode (background).  
- `-p 80:80` → Maps port 80 of the instance to port 80 in the container.  
- `--name my_nginx` → Assigns a custom name to the container.  

---

## **5️⃣ Verify the Running Container**
To check if the container is running:
```bash
docker ps
```
You should see `my_nginx` in the list.

![image](https://github.com/user-attachments/assets/a17c84f6-9b9c-467a-b52a-5ef0865a8c63)


To log in to the Nginx container:
```bash
docker exec -it my_nginx /bin/bash
```

---

## **6️⃣ Access Nginx on the AWS Instance**
1. Copy the **public IP** of your EC2 instance from the AWS console.
2. Open a browser and enter:
```
http://43.204.100.109
```
You should see the Nginx welcome page.

![image](https://github.com/user-attachments/assets/5b31073a-1a44-4d7e-bace-ead9b7fe6323)


---

## **7️⃣ Deploy HTTPD (Apache) on AWS Linux Server**
### **Create an AWS Linux Instance**
1. In the **AWS EC2 Dashboard**, launch a new instance.
2. Select **Amazon Linux 2** as the AMI.
3. Choose an instance type (e.g., **t2.micro**).
4. Configure security groups:
   - Allow **SSH (port 22)** for remote access.
   - Allow **HTTP (port 80)** for web access.
5. Launch the instance and **connect via SSH**:
   ```bash
   ssh -i your-key.pem ec2-user@your-instance-ip
   ```

### **Install Docker on AWS Linux Instance**
```bash
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
```

### **Pull the HTTPD (Apache) Image from Docker Hub**
Download the latest HTTPD image:
```bash
docker pull httpd
```
To pull a specific version (e.g., HTTPD 2.4), use:
```bash
docker pull httpd:2.4
```

### **Run the HTTPD Container**
Start an HTTPD container and expose it on port **80**:
```bash
docker run -d -p 80:80 --name c1 httpd
```
- `-d` → Runs the container in detached mode (background).  
- `-p 80:80` → Maps port 80 of the instance to port 80 in the container.  
- `--name c1` → Assigns a custom name to the container.  

---

## **8️⃣ Verify the Running HTTPD Container**
To check if the container is running:
```bash
docker ps
```
![image](https://github.com/user-attachments/assets/58cb7966-bb8f-4cb7-a4a9-cff2ac38cb83)

You should see `c1` in the list.

To log in to the HTTPD container:
```bash
docker exec -it c1 /bin/bash
```

---

## **9️⃣ Access HTTPD on the AWS Instance**
1. Copy the **public IP** of your AWS Linux instance from the AWS console.
2. Open a browser and enter:
```
http://65.0.109.163
```
You should see the default Apache HTTPD test page.
![image](https://github.com/user-attachments/assets/1a7cafec-753a-4f99-9a54-d61d5bd4472a)


---

## **🔟 Manage the Nginx & HTTPD Containers**
- **Stop the Nginx container:**  
  ```bash
  docker stop my_nginx
  ```
- **Start the Nginx container again:**  
  ```bash
  docker start my_nginx
  ```
- **Remove the Nginx container permanently:**  
  ```bash
  docker rm my_nginx
  ```
- **Remove the Nginx image:**  
  ```bash
  docker rmi nginx
  ```
- **Stop the HTTPD container:**
  ```bash
  docker stop my_httpd
  ```
- **Start the HTTPD container:**
  ```bash
  docker start my_httpd
  ```
- **Remove the HTTPD container:**
  ```bash
  docker rm my_httpd
  ```
- **Remove the HTTPD image:**
  ```bash
  docker rmi httpd
  ```

---

## **🎯 Summary**
1️⃣ **Create Ubuntu EC2 instance on AWS**  
2️⃣ **Install Docker** → `sudo apt install docker.io -y`  
3️⃣ **Pull Nginx image** → `docker pull nginx`  
4️⃣ **Run Nginx container** → `docker run -d -p 80:80 --name my_nginx nginx`  
5️⃣ **Check running containers** → `docker ps`  
6️⃣ **Access Nginx on AWS** → `http://your-instance-ip`  
7️⃣ **Create AWS Linux EC2 instance & install Docker** → `sudo yum install docker -y`  
8️⃣ **Pull HTTPD image** → `docker pull httpd`  
9️⃣ **Run HTTPD container** → `docker run -d -p 80:80 --name my_httpd httpd`  
🔟 **Access HTTPD on AWS** → `http://your-instance-ip`  

---


                                                           ## K8s ARCHITECTURE
![Kubernetes-architecture-diagram-1-1](https://github.com/user-attachments/assets/eb043f56-0b83-4f36-b74c-f8f6c7292188)

CONSIST OF 2 component

WORKER NODE 
CONTROL PLANE

ETCD CLUSTER
CONTROLLER MANAGER
SCHEDULER
API SERVER
KUBE_PROXY
KUBELET
POD
CONTAINER RUNTIME

```bash
ETCD Cluster: A distributed key-value store for storing Kubernetes cluster data.

Controller Manager: Manages controllers to ensure the desired state of the cluster (e.g., scaling, healing).

Scheduler: Assigns newly created pods to nodes based on resource availability.

API Server: The entry point for all Kubernetes operations, exposing the Kubernetes API.

Kube-Proxy: Manages network traffic routing to services and pods in the cluster.

Kubelet: Ensures containers in pods are running and healthy on each node.

Pod: The smallest deployable unit in Kubernetes, typically consisting of one or more containers.

Container Runtime: Software responsible for running and managing containers (e.g., Docker, containerd).
```
pod.yaml
kubectl apply -f pod.yaml

clusterip (access app within cluster)
nodeport (access app outside cluster)
to access pods - loadbalancer

===================================================================================================================================================================================================================


Here's a basic example of a Kubernetes YAML file. This file defines a Pod and Service. The YAML files in Kubernetes are typically used for deploying resources like Pods, Deployments, Services, ConfigMaps, and more.

# Example 1: Pod YAML File
This is a simple Pod definition that runs a single container (nginx):

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  labels:
    app: nginx
spec:
  containers:
  - name: nginx
    image: nginx:latest
    ports:
    - containerPort: 80
```
Breakdown:
apiVersion: v1: Specifies the API version to use for the Pod resource.

kind: Pod: The type of resource (in this case, a Pod).

metadata: Contains metadata like the name and labels for the Pod.

spec: Describes the desired state of the container.

containers: Specifies the containers that will run in the Pod.

name: The name of the container.

image: The container image to use (in this case, nginx:latest).

ports: Specifies which ports to expose from the container.

Example 2: Deployment YAML File
A more complex resource is a Deployment which manages a set of replicas of a Pod:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```
Breakdown:
apiVersion: apps/v1: The API version for the Deployment resource.

kind: Deployment: The type of resource (in this case, a Deployment).

metadata: Contains metadata like the name of the Deployment.

spec: Describes the desired state of the Deployment.

replicas: 3: Defines the number of Pods to run (3 in this case).

selector: Specifies how to select the Pods that this Deployment manages.

template: Defines the Pod template that will be used for the Deployment.

containers: The container configuration inside the Pods.

ports: Specifies the ports the containers expose.

Example 3: Service YAML File
A Service YAML file to expose the nginx Deployment:

```yaml
Copy
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: ClusterIP
```
Breakdown:
apiVersion: v1: The API version for the Service resource.

kind: Service: The type of resource (Service).

metadata: Contains metadata like the name of the Service.

spec: Defines the specifications of the Service.

selector: Defines how the Service will target Pods (matching Pods with the label app: nginx).

ports: Specifies the ports for the Service.

port: The port exposed by the Service.

targetPort: The port on the container that the Service forwards traffic to.

type: ClusterIP: This is the default Service type, making it accessible only within the cluster.

Example 4: ConfigMap YAML File
If you want to store configuration data, you can use a ConfigMap:

```yaml
Copy
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-config
data:
  nginx.conf: |
    server {
      listen 80;
      server_name localhost;
      location / {
        root /usr/share/nginx/html;
        index index.html index.htm;
      }
    }
```
Breakdown:
apiVersion: v1: The API version for the ConfigMap resource.

kind: ConfigMap: The type of resource (ConfigMap).

metadata: Contains metadata like the name of the ConfigMap.

data: The actual data stored in the ConfigMap.

The nginx.conf data is a simple nginx configuration that can be used in an nginx container.

How to Apply a YAML File to Kubernetes:
Once you have your YAML file, you can apply it to your Kubernetes cluster using the kubectl command:

```bash
kubectl apply -f <file-name>.yaml
```
For example, to create the nginx-deployment:

```bash
kubectl apply -f nginx-deployment.yaml
```

This will deploy your resources (Pod, Deployment, Service, etc.) to the Kubernetes cluster.




ls
vim pod.yaml
pod yaml
kubectl apply -f pod.yaml (creates pod)

get pods
kubectl describe pod <podname> 
  (shows pod details)

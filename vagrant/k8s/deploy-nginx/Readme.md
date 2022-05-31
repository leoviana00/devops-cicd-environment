## Main K8S Components

1. Pod
  - Smallest unit of k8s
  - Abstraction over container
  - Usually 1 application per Pod
  - Each Pod gets its own IP adress
  - New IP adress on re-creation  =/


2. Service
  - Permanent IP address
  - Lifecycle of Pod and Service NOT connected =) 

3. Ingress
  - App should be accessible through browse

4. ConfigMap
  - Database URL usually in the built application
  - External Configuration of your application 
    - DB_URL = mongo-db-service
  - Dont put credentials into ConfigMap

5. Secret
  - Used to store secret data
    - mongo-user
    - mongo-pass
  - Base 64 encoded
  - The built-in security mechanism is not anable by default!
  - Use it as environment variables or as a properties file

6. Volumes
  - Data storages
  - DB - Volumes
    - Storage on local machine
    - Or remote, outside of the k8s cluster
  - K8s doesnt manage data persistance

7. Deployment and Stateful Set
  - Downtime - cant be reached
  - Service has 2 funcionalities
    - Permanet IP
    - LoadBalancer
  - Replicate everything
  - The replica is connected to the same service
  - Define blueprint for pods
    - Deployment
      - Blueprint for my-app pods
      - You create Deployments
      - Abstraction of Pods
      - Scale UP or Slacale DOWN replicas
      - DB can't be replicated via Deployment!
        - Avoid data inconsistencies!
    - StatefulSet
      - For Stateful apps
      - `Deployment` for stateLESS Apps
      - `StatefulSet`for stateFUL Apps or Dtabases
      - DB are often hosted outside of k8s cluster

>> Main Kubernetes Components summarized

1. Abstraction of container    ------- Pod
2. Communication  -------------------- Service
3. Route traffic into cluster -------- Ingress
4. External configuration ------------ ConfigMap | Secrets
5. Armazenamento --------------------- Volumes
6. Blueprints ------------------------ Deployments | StatefulSet

## Basic Kubernetes Architecture

1. Worker machine in k8s cluster (NODES)
  - Each Node has multiple Pods on it
  - 3 process must be installed on every Node
    - `Container runtime`
    - `kubelet`
      - Kubelet interacts with  both - the container and node
      - Kubelet starts the pod with a container inside
      - Comunication via Services
    - `Kube Proxy`
      - Kube Proxy forwards the requests
  - Worker Nodes do the actual work
>> How do you interact with this cluster?
  - Schedule pod?
  - Monitor?
  - Re-schedule/re-start pod?
  - Join a new Node

2. Managing process are done by Master Nodes
- Master Process
- 4 process run on every master node!
  - `Api Server`
    - Deploy application
    - Client - Update | Query - Dashboard
    - Create new services
    - cluster gateway
    - acts as a gatekeeper for authentication
    >> Some request > API server > validates request > other process > scheduled pod or create components
  - `Scheduler`
    - Scheduled new Pod > API Server > Scheduler > Pod > Where to put the pod > Inteligence > at least busy
    - Scheduler just decides on which Node new Pod should be scheduled
  - `Controller Manager` 
    - Detects cluster state changes
    >> Controller Manager > Scheduler > Kubelet > Pod
  - `Etcd`
    - Key Values Store over cluster state
    - etcd is the cluster brain!
    - cluster changes get stored in the key value store
      - What resources are available?
      - Did the cluster state change?
      - Is the cluster healthy?
      - Application data is NOT stored in etcd!

  - Multiples Master
    - API Server is Loadbalanced.
    - Distributed storage across all master nodes
 

## Kubectl
- Command line tool for k8s cluster 
- Master Processes > API Server > enable interaction with cluster
  - UI (Dashboard)
  - API
  - CLI (Kubectl)
    - The most powerful of 3 clients

## Basic Kubectl Commands

- Create and debug Pods in a k8s cluster

1. CRUD commands (`Create`, `Edit`, `Delete` deployment )

```bash
kubectl create deployment [name]
kubectl edit deployment [name]
kubectl delete deployment [name]
```

2. Status of different k8s components

```bash
kubectl get nodes
kubectl get pod
kubectl get service
kubectl get replicaset
kubectl get deployment
```
3. Debugging pods (`Log` to console, Get `Interactive Terminal`)

```bash
kubectl logs [pod name]
kubectl exec -it [pod name] -- bin/bash
```

- Example
- Deployment
```bash
kubectl create deployment nginx-depl --image=nginx
```
- blueprint for creating pods
- Most basic configuration for deployment (name and image to use)
- rest defaults

- Replicaset
```bash
kubectl get replicaset
```
- Replicaset is managing the replicas of a pod

- Layers of Abstraction
  - `Deployment` manages a ...
  - `ReplicaSet` manages a ...
  - `Pod` is an abstraction of ...
  - `Container`
- Everything below Deployment is handled by Kubernetes

```bash
kubectl edit deployment ndinx-deployment
```
- Change pod replica from 1 to 2

```bash
kubectl get pod
```
```bash
kubectl get replicaset
```

## K8s YAML Configuratio File

- `YAML` Configuration File in Kubernetes

## Overview

- The `3 parts` of configuration file
- `Connecting` Deployments to Service to Pods
- `Demo`

## The `3 parts` of configuration file

- Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
    replicas: 2
    selector: ...
    templates: ...
```

- Service

```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector: ...
  ports: ...
```

- Status
```yaml
status:
  availableReplicas: 2
  conditions:
  - lastTransitionTime: "2022-05-26T13:32:40Z"
    lastUpdateTime: "2022-05-26T13:32:40Z"
    message: Deployment has minimum availability.
    reason: MinimumReplicasAvailable
    status: "True"
    type: Available
  - lastTransitionTime: "2022-05-26T13:32:37Z"
    lastUpdateTime: "2022-05-26T13:32:40Z"
    message: ReplicaSet "nginx-deployment-f4b7bbcbc" has successfully progressed.
    reason: NewReplicaSetAvailable
    status: "True"
    type: Progressing
  observedGeneration: 1
  readyReplicas: 2
  replicas: 2
  updatedReplicas: 2
```
- Each configuration file has 3 parts

1. Part 1 - METADATA
2. Part 2 - SPECIFICATION (Attributes of "spec" are specific to the kind!)
3. Part 3 - STATUS (Automatically generated and added by kubernetes!)

Obs: Etcd holds the current status of any k8s component!


## Label and Selectors
- Connecting Deployment to Pods
- any key-value pair for component
- Connecting Services to Deployment

## Project
1. K8s Components

- 2 Deployment / Pod
- 2 Service
- 1 ConfigMap
- 1 Secret

>> MongoDB (Internal Service) 
- Pod

>> ConfigMap 
- DB Uri

>> Secret 
- DB User 
- DB pwd

>> Deployment.yaml  
- Env 
- Variables

>> Mongo Express (External Service)
- Pod

>> External Service - URL
- IP Address of Node
- Port of external Service

## Stages
- Mongodb

1. Create Deployment mongodb
2. CReate secret mongodb
    - echo -n 'username' | base64
    - echo -n 'password' | base64
3. Reference Secret in Deployment 
4. Create Service mongodb

- Mongo Express

1. Create Deployment mongo-express
2. Variable: 
  - Which databse to connect? 
    - MONGODB_SERVER
  - With credential to authenticate?
    - ADMINUSERNAME
    - ADMINPASSWORD
3. Create configmap
4. Create Service and make it an External Service

## Kubernetes Namespaces Explained

1. What is a namespace?
  - organise resource in namespaces
  - virtual cluster inside a cluster
  - 4 namespaces per default
    - default
      - resource you create are located here
    - kube-system
      - Do not create or modify in kube-system
      - system process
      - master and kubectl process
    - kube-public
      - publicely accessible data
      - A configmap, witch contains cluster information (kubectl cluster-info)
    - kube-node-lease
      - heartbeats of nodes
      - each node has associated lease object in namespace
      - determines the availability of a node

- Create a new namespaces
```bash
kubectl create namespace my-namespaces
```

- Create namespace with configuration file
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: mongodb-configmap
  namespace: my-namespace
data:
  database_url: mongodb-service
```
- Why to use namespaces?
  1. Everything in one namespace (NO OVERVIEW)
    - default
      - deployments
      - replicasets
      - services
      - configmaps

  2. Resources grouped in namespaces
    - ns-database
      - deployments
      - replicasets
      - services
      - configmaps
    - ns-monitoring
      - deployments
      - replicasets
      - services
      - configmaps
    - ns-elastistack
      - deployments
      - replicasets
      - services
      - configmaps
  
  3. Conflicts: Many team, same applications (same name, but different configuration - They override the first teams deployment)
  4. Resources Sharng: 
    - staging and development
      - re-use components in both environments
    - Blue/Green Deployment
  4. Access and resources limits on namespaces
    - Each team has own, isolated environment
    - Limit: CPU, RAM , storage per ns

2. What are the use cases?

  - Structure your components
  - Avoid conflicts between teams
  - Share services between different environments
  - Access and resources limits on namespaces level

- Caracteristics of namespaces
  - You cant access most resources from another namespaces
  - Each namespaces must define own configmap
  - Components, whitch cant be created within a namespace

```bash
kubectl api-resources --namespaced=false
kubectl api-resources --namespaced=true
```
- Create compontents - No namespace defined, by default, components are created in a default namespace 
- Create component in namespace - config file over kubectl cmd
```bash
kubectl apply -f db-configmap.yaml --namespace=my-namespace
```

- Change active namespace with kubens

- Install kubectx
```bash
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
```
```bash
kubens
```
```bash
kubens my-namespaces
```

3. How namespaces work and how to use it

## Kubernetes Ingress Explained
- What is Ingress?
- Ingress Yaml configuration
- When do you need ingress?
- Ingress controller

>> External service vs ingress

- my-app`pod` >> my-app`service`    >>> Browser: http://myapp-service-ip:port >>> my-app`ingress`>>> Browser: http://my-app.com

- We have a pod of my application and its corresponding service my-app service, so the first thing you need for your ui application is to be accessible through browser right, so for external request to be able to reach tour application, so one way to do that an easy way is trough an external service were basically you can access the application using http protocol the ip address of the node and the port however this is good for test cases and if you want to try something very fast but this is not what the final product should look like the final product should be like this, so you have a domain name for application and you want a security connection using https, so the way to do that is using kubernetes components called ingress,  so you have my-app ingress and instead of external service you would instead have an internal service, so you would not open your application through the ip address and the port and now if the requests comes from the browser its going to first reach the ingress and ingress then we'll redirect it to the internal service then it will eventually end up with the pod so now let's actually take a look and see how external service configuration looks like so that you have a practical understanding so you have the service which is of type loadbalancer this means we are opening it to public by assigning an external ip address to the service and this is the port number that user can access the application at so basically the ip addres the external ip address and the port number that you specify here. 

- Ingress and Internal Service configuration
- Desfault type not a loadbalancer but internal service tyoe which a cluster ip

>> HOTS
  - Valid domain addres
  - map domain name to Node's IP address, which is the entrepoint
>> HOW TO CONFIGURE INGRESS IN YOUR K8S CLUSTER?

  - my-app`POD`  <<  my-app`SERVICE` (INTERNAL)  <<  my-app`INGRESS`  << INGRES CONTROLLER `POD`
  - You need an implementation for ingress
  - Which is ingres controller

>> Ingress Controller
  - Evaluates all the rules that you have defined in your cluster and this way to manage all the redirections, so basically this will the entrypoint the cluster for all the request to that domain or subdomain rules that you've configured an this will evaluate all the rule because you may have 50 rules or 50 ingress components created in your cluster it will evaluate all the rules and decide based on that which forwarding rule applies fot that specific request 

>> Ussing k8s ingress controller


## Helm explained 

- Main concepts of helm
- Helm changes a lot between versions, so:
  - Understand basic common principles and use cases

- Overview:
  - What is helm?
    - Package manager for kubernetes
    - To package YAML files
    - Distribute them in public and private repositories
  - What are helm charts?
    - Bundle of YAML files
    - Create your own Helm Charts with Helm
    - Push them to Helm repository
    - Download and use existing ones
  - How to use them?
  - When tu use them?
  - What is tiller?
 

>> Helm Chart Structure

- mychart/
  - Chart.yaml
  - values.yaml
  - charts/
  - templates/

- Top level `mychart` folder >> name of chart
- Chart.yaml >> meta info about chart (name, version, dependecies etc...)
- values.yaml >> values for the template files (Default values you can override)
- charts folder >>> chart dependecies
- temlates folder >> the actual template file

```bash
helm instamm chartname
```
- Templates file will be filled with de values from the values.yaml produce valid kubernetes manifest the can then be deployed into kubernetes
- OPtionally other files like readme or license file 

>> Values inject into templates file
- values.yaml
```yaml
imageName: myapp
port: 8080
version: 1.0.0
```

```bash
helm install --values=my-values.yaml <chatname>
```
- my-values.yaml
```yaml
version: 2.0.0
```

- result
```yaml
imageName: myapp
port: 8080
version: 2.0.0
```

- Or command line
```bash
helm install --set version=2.0.0
```

>> Release Management

- Helm version 2 comes in two parts:
  - Client (helm cli)
  - Server (Tiller)
```bash
helm install <chartname>
helm upgrade <chartname>
helm rollback <chartname>
```

- Downside Tiller
  - Tiller has too much power inside of k8s cluster
  - Security issue
  - Solves the security concern
  - In Helm 3 tiller got removed


## Kubernetes Volumes

- How to persist data in kubernetes using volumes?
  - Persistent Volume
  - Persistent volum clain
  - Storage class

- The need for volumes

>> myapp >added>> mysql  >>> storage
  - you need to configure that 
>> Stirage requirements
  - Storage that doesnt depend on the pod lifecycle
  - storage must be available on all nodes
  - Storage needs to survive even if cluster crashes
>> Persistent volume
  - A cluster reource
  - Created via yam file
    - kind
    - Spec e.g. How much storge?
  - Need actual physical storage, like:
    - local disk
    - external nfs server
    - cloud storage

>> Local vs Remote volumes type
  - Each volume type has it's own use case
  - Local volume types violate 2. and 3. requirement for data persistence

## Kubernetes Statefulet Explained
- What is StatefulSet?
- Why StatefulSet is used?
- How Statefulset works and how its different from deployment?
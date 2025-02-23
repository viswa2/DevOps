1. What is Kubernetes?
Kubernetes, also known as K8s, is an open-source system for automating deployment, auto-scaling, high availability, self-healing and  management of containerized applications.

2. Kubernetes vs. Docker: When to Use What?


|   Feature          |            Docker                             |              Kubernetes                                                      |
|  ----------        |        --------------                         |            ---------------                                                   |
|  Purpose           | Run and manage containers on a single host    | Orchestrate and manage multiple containers across multiple nodes             |
|                    | Manual (requires running multiple docker      |                                                                              |
|  Scaling           | run commands)                                 | Automatic scaling with Horizontal Pod Autoscaler (HPA)                       |
|                    |                                               |                                                                              |
| High Availability  | No built-in support                           | Self-healing, load balancing, and failover across multiple nodes             |
|                    |                                               |                                                                              |
| Networking         | Basic networking between continers            | Advanced networking with built-in service discovery                          |
|                    |                                               |                                                                              |
| Storage Management | Limited to host volumes & bind mounts         | Persistent Volumes (PV), Persistent Volume Claims (PVC), and Storage Classes |
|                    |                                               |                                                                              |  
| Service Discovery &| Needs external setup                          | Built-in with Kubernetes Services                                            |
| Load Balancing     |                                               |                                                                              |
|                    |                                               |                                                                              |
| Rolling Updates    | Requires manual stopping &                    | Automated rolling updates with zero downtime                                 |
|                    | starting of containers                        |                                                                              |
|                    |                                               |                                                                              |
| Self-Healing       | If a container crashes, manual restart needed | Kubernetes automatically restarts failed containers or moves workloads       |


3. Scenarios: When to Use Kubernetes?

1️⃣ Large-Scale Applications
When your application consists of multiple microservices (e.g., frontend, backend, database, message queues).
Example: A banking application with independent services for authentication, transactions, notifications, etc.

2️⃣ High Availability & Fault Tolerance
Kubernetes ensures your application remains available even if a node crashes by rescheduling workloads.
Example: E-commerce platforms (Amazon, Flipkart) need 24/7 availability.

3️⃣ Automated Scaling
Kubernetes automatically adjusts resources based on traffic or CPU/memory usage.
Example: Streaming platforms (Netflix, YouTube) see high traffic during peak hours and need dynamic scaling.

4️⃣ CI/CD & DevOps Integration
Kubernetes enables zero-downtime deployments with automated updates & rollbacks.
Example: Software development teams deploying frequent updates to a SaaS product.

5️⃣ Hybrid & Multi-Cloud Deployments
Kubernetes runs seamlessly across AWS, Azure, GCP, and on-premises.
Example: Enterprise-grade needing cloud-agnostic application deployment.


When Docker Alone is Enough?

Local Development & Testing: Running a single containerized app on your laptop (docker run -d nginx).

Small-scale Applications: If you have just a few containers and don’t need scaling or load balancing.

Quick Prototyping: Deploying a simple blog or personal website.

4. What we can achieve by using Kubernetes?

High availability --> No down time

High scalability --> High performance

Disaster recovery --> Backup and restore

5. What is Kubernetes orchestration?
Kubernetes orchestration allows you to build application services that span multiple containers, schedule containers across a cluster, scale those containers, and manage their health over time.

6. Kubernetes Architecture?

Kubernetes Mainly having 2 components

	Master Node --> Control plane Components
  Worker Node --> Worker Node Components

<img width="836" alt="Cluster-Architecture" src="https://github.com/viswa2/DevOps/assets/34201574/04488413-8b0f-4836-9a52-8b5771f06409">

A Kubernetes cluster consists of a set of worker machines, called nodes, that run containerized applications. Every cluster has at least one worker node.
The worker node(s) host the Pods that are the components of the application workload. The control plane manages the worker nodes and the Pods in the cluster. In production environments, the control plane usually runs across multiple computers and a cluster usually runs multiple nodes, providing fault-tolerance and high availability.
This document outlines the various components you need to have for a complete and working Kubernetes cluster.

## Control plane components ##

The control plane's components make global decisions about the cluster (for example, scheduling), as well as detecting and responding to cluster events (for example, starting up a new pod when a deployment's replicas field is unsatisfied).

1. Kube-apiserver

The API server is a component of the Kubernetes control plane that exposes the Kubernetes API. The API server is the front end for the Kubernetes control plane.
The main implementation of a Kubernetes API server is kube-apiserver. kube-apiserver is designed to scale horizontally—that is, it scales by deploying more instances. You can run several instances of kube-apiserver and balance traffic between those instances. kube-apiserver and balance traffic between those instances.

2.	etcd
	
Consistent and highly-available key value store used as Kubernetes' backing store for all cluster data. If your Kubernetes cluster uses etcd as its backing store, make sure you have a backup plan for the data. You can find in-depth information about etcd in the official documentation.

3.	kube-scheduler
   
Control plane component that watches for newly created Pods with no assigned node, and selects a node for them to run on.
Factors taken into account for scheduling decisions include: individual and collective resource requirements, hardware/software/policy constraints, affinity and anti-affinity specifications, data locality, inter-workload interference, and deadlines.

4. kube-controller-manager

Control plane component that runs controller processes.

Logically, each controller is a separate process, but to reduce complexity, they are all compiled into a single binary and run in a single process.
There are many different types of controllers. Some examples of them are:

-->	Node controller: Responsible for noticing and responding when nodes go down.

--> Job controller: Watches for Job objects that represent one-off tasks, then creates Pods to run those tasks to completion.

--> Endpoint Slice controller: Populates Endpoint Slice objects (to provide a link between Services and Pods).

--> Service Account controller: Create default Service Accounts for new namespaces.

The above is not an exhaustive list.

## Worker Node Components ##

Node components run on every node, maintaining running pods and providing the Kubernetes runtime environment.

1. kubelet

An agent that runs on each node in the cluster. It makes sure that containers are running in a Pod. The kubelet takes a set of PodSpecs that are provided through various mechanisms and ensures that the containers described in those PodSpecs are running and healthy. 

2. kube-proxy 

kube-proxy is a network proxy that runs on each node in your cluster, implementing part of the Kubernetes Service concept. kube-proxy maintains network rules on nodes. These network rules allow network communication to your Pods from network sessions inside or outside of your cluster.

3. Pod

A Pod is a Kubernetes abstraction that represents a group of one or more application containers (such as Docker), and some shared resources for those containers.

## How to Setup Kubernetes Multi Node Cluster Setup In a Local Machine ##

`Reference Link to Install Kuberenets Cluster`: https://kind.sigs.k8s.io/docs/user/quick-start/#installation

`Kind Cluster Releases Link`: https://github.com/kubernetes-sigs/kind/releases

Follow as per the reference link according to the Operating Systems I.e Windows, MacOS, Linux etc.

1. We are following the kind kubernets cluster to install in our local machine.

2. brew install kind

3. kind create cluster —image kindest/node:v1.31.0@sha256:53df588e04085fd41ae12de0c3fe4c72f7013bba32a20e7325357a1ac94ba865 —name cka-cluster1 

i.e Here Kind create cluster --> Creaeting the cluster 

    --image kindest/node:v1.31.0@sha256:53df588e04085fd41ae12de0c3fe4c72f7013bba32a20e7325357a1ac94ba865 --> Image release version of sha code
    -- name cka-cluster1 --> Name of the cluster

4. kubectl cluster-info --context kind-cka-cluster1 --> Get the cluster info

5. Install kubectl command line interface in your system which matches the kubernetes version.

6. kubectl get nodes --> Shows in available nodes on the system

7. Currently we have single node which is control plane, we want to setup multi node cluster which requires additional details.

8. Create vi config.yaml and paste the below contenet

```bash
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
```

9. kind create cluster --image kindest/node:v1.31.0@sha256:53df588e04085fd41ae12de0c3fe4c72f7013bba32a20e7325357a1ac94ba865 --name cka-cluster2 --config config.yaml --> based on the yaml configuration we are installing the 1 control plane and 2 worker nodes.

10. kubectl cluster-info --context kind-cka-cluster2 --> It will display the cluster informationas below.

Kubernetes control plane is running at https://127.0.0.1:50868
CoreDNS is running at https://127.0.0.1:50868/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.

11. kubectl config get-contexts --> It will display the available kubernetes clusters list

![alt text](Available-Kubernetes-clusters-info.png)

`Note`: There are multiple clusters how it's should interact each other we need to set the context here.

12. kubectl config use-context kind-cka-cluster1 --> It will switch the kind-cka-cluster1

13. kubectl config use-context kind-cka-cluster2 --> It will switch the kind-cka-cluster2

14. Finally check the nodes We have one control-plane and 2 worker nodes for kind cluster

kubectl get nodes 

NAME                        STATUS     ROLES         AGE    VERSION
cka-cluster2-control-plane  Ready   control-plane    11m    v1.31.0
cka-cluster2-worker         Ready         <none>     10m    v1.31.0
cka-cluster2-worker2        Ready        <none>      10m    v1.31.0

## Kubernetes Pods ##

In Kubernetes, Pods are the smallest deployable units. You can create

Imperative Approach → Quick, command-based (best for ad-hoc changes)

Declarative Approach → YAML-based, version-controlled (best for production)

![alt text](<Pod_Imperative vs Declarative-1.jpeg>)

Imperative (Command-Based) Approach

1. kubectl run mypod --image=nginx --> Create a Pod instantly

2. kubectl run mypod --image=nginx --dry-run=client --> Dry Run (Preview Before Applying):

3. kubectl run mypod --image=nginx --dry-run=client -o yaml > pod.yaml --> Generate YAML from Dry Run (For Future Use)

4. Declarative (YAML-Based) Approach: --> day-07-pods/pod.yaml

5. kubectl apply -f pod.yaml --> To create a pod based on the yaml structure

6. kubectl describe pod mypod --> To debugging and monitoring and check the events also if in case any errors

7. kubectl get pods --nginx-pod --show-labels --> To check the labels associated with.

8. kubectl get pods nginx-pod --show-labels --> To check on which node pod is running

9. kubectl edit pod nginx-pod --> we can edit the running pod configuration once save it will apply the editable configuration.

## ReplicationController vs ReplicaSet ##

ReplicationController: Ensures a specified number of pod replicas are running at any given time.
                       Uses equality-based selectors (key=value) to match pods.
                       Considered deprecated in favor of ReplicaSet. i.e (Old Legacy based)

ReplicaSet: An improved version of ReplicationController.
            Supports both equality-based and set-based selectors (in, notin operations).
            Used as part of Deployments to manage pods more efficiently.

Commands to execute to replicaset:

kubectl create -f replicaset.yaml --> Creating a ReplicaSet
kubectl get rs --> Listing ReplicaSets
kubectl describe rs <replicaset-name> --> Describing a ReplicaSet       

Check for more details: `day-08-replicasset & deployment/replicaset.yaml`

## Deployment ##

Deployments provide declarative updates for Pods and ReplicaSets.

Manage rollouts, rollbacks, and scaling of applications.

Check for more details: `day-08-replicasset & deployment/deploy.yaml`

kubectl create -f deployment.yaml --> Creating a Deployment

kubectl get deployments --> Listing Deployments

kubectl rollout status deployment <deployment-name> --> Checking the rollout status

kubectl scale deployment <deployment-name> --replicas=5 --> Scaling a Deployment

kubectl rollout undo deployment <deployment-name> --> Rolling back a Deployment
 
## Kubernetes Services ##

What is a Kubernetes Service?

In Kubernetes, a Service is a method for exposing a network application that is running as one or more Pods in your cluster.

Types of Kubernetes Services ⬇️

ClusterIP (Default) 🌐

✅ Exposes the service internally within the cluster.
✅ Pods can communicate using the service name.
✅ Example use case: Internal microservices communication.

`Check for more details for laod balancer`: `day-09-kubernetes-services/clusterip.yaml`

🔸 NodePort 🚪

✅ Exposes the service on each node’s IP and a static port (30000-32767).
✅ Accessible externally via NodeIP:NodePort.
✅ Example use case: Direct external access without a LoadBalancer.

🔸 LoadBalancer ⚖️

✅ Provisions an external load balancer (cloud provider-specific).
✅ Distributes traffic to backend pods.
✅ Example use case: Exposing an application to the internet.

`Check for more details for laod balancer`: `day-09-kubernetes-services/lb.yaml`

🔸 ExternalName 🔗

✅ Maps a Kubernetes service to an external DNS name.
✅ Example use case: Redirecting traffic to an external database or API.

`Note`: Since I'm using the KIND cluster which requires an additional step for `extra port mappings of cluster`, It can be useful if using NodePort services or daemonsets exposing host ports. There is no need of additional configuration of extra port mapping yif you were using the AWS EKS, GKS, AKS etc.

`Reference Link for extra ports from the nodes to the host`: https://kind.sigs.k8s.io/docs/user/quick-start/#installation

✅ Deployed a Sample Application 🚀

✅ Exposed the application using ClusterIP, NodePort, and LoadBalancer Services 🌍

✅ Created the load balancer SVC but we are not provisioned the external load balancer with in our system that's the reason external ip is pending.

✅ Tested connectivity within the cluster using kubectl get services and curl <localhost>:<hostport> 🔎 by using the node port service.

kubectl get svc
NAME           TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
nodeport-svc   NodePort    10.96.228.8     <none>        80:30007/TCP   5d23h

`This means:`

The service is running inside the cluster at port 80.
The NodePort is 30007.

We have mapped containerPort: 30007 → hostPort: 30000, you should test it using: curl localhost:30000

![alt text](SVC-Test-1.png)

Check the details: `day-09-kubernetes-services/nodeport.yaml`

## Kubernetes Namespaces ##

In Kubernetes, namespaces provide a mechanism for isolating groups of resources within a single cluster. Without specifying a namespace, Kubernetes defaults to the default namespace and there are other namepsaces are avilable by default i.e kube-public, kube-system etc.

When to use namespaces?

Namespaces are intended for use in environments with many users spread across multiple teams, or projects. Proper namespace usage avoids conflicts and enhances security in large-scale deployments.

As part of hands on for the Namespaces:

✅ Created two namespaces: `test and test1`
✅ Deployed an Nginx application in both namespaces
✅ Logged into the pod and tested communication using NodeIP

Attached the Screen shot for reference:

![alt text](<Testing B:w the Pods Using Node Ip.png>)

✅ Scaled the deployment to multiple replicas
✅ Exposed the deployment as a service

`Note:` If we use the service In different namespaces the pods won't commuinicate by simply using curl command?

📌 When to Use FQDN (Fully Qualified Domain Name)?

`Note:` When two pods in different namespaces need to communicate using ClusterIP, the `FQDN` must be used. Kubernetes service discovery follows the format:

<service-name>.<namespace>.svc.cluster.local

For example, if a service `nginx-service exists in the test namespace, a pod in test1 namespace can reach it` using as below.

`Ex:` curl nginx-service.test.svc.cluster.local 

This ensures the correct service resolution across namespaces.

📌 Why Don’t Services in Different Namespaces Communicate by Default?

Even though all services exist within the same cluster, Kubernetes limits inter-namespace communication by default due to network policies and DNS resolution rules. Here’s why:

1️⃣ ClusterIP is Namespace-Scoped: When a service is exposed with a ClusterIP, it is only resolvable within its own namespace unless explicitly referenced with FQDN.

2️⃣ Network Policies Can Restrict Access: If NetworkPolicies are applied, they might block traffic between namespaces unless explicitly allowed.

3️⃣ Default DNS Behavior: A pod in test1 querying nginx-service without FQDN will fail because Kubernetes defaults to resolving within the same namespace (test1).

🚀 Solution? If inter-namespace communication is required, use the FQDN and ensure network policies permit the traffic.

![alt text](<Inter-namespace-communication by using fqdn.png>)




 

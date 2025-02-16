1. What is Kubernetes?
Kubernetes, also known as K8s, is an open-source system for automating deployment, scaling, and management of containerized applications.

2. What we can achieve by using Kubernetes?
High availability --> No down time
High scalability --> High performance
Disaster recovery --> Backup and restore

3. What is Kubernetes orchestration?
Kubernetes orchestration allows you to build application services that span multiple containers, schedule containers across a cluster, scale those containers, and manage their health over time.

4. Kubernetes Architecture?
Kubernetes Mainly having 2 components
	Master Node --> Control plane Components
  Worker Node --> Worker Node Components

<img width="836" alt="Cluster-Architecture" src="https://github.com/viswa2/DevOps/assets/34201574/04488413-8b0f-4836-9a52-8b5771f06409">

A Kubernetes cluster consists of a set of worker machines, called nodes, that run containerized applications. Every cluster has at least one worker node.
The worker node(s) host the Pods that are the components of the application workload. The control plane manages the worker nodes and the Pods in the cluster. In production environments, the control plane usually runs across multiple computers and a cluster usually runs multiple nodes, providing fault-tolerance and high availability.
This document outlines the various components you need to have for a complete and working Kubernetes cluster.

## Control plane components ##

The control plane's components make global decisions about the cluster (for example, scheduling), as well as detecting and responding to cluster events (for example, starting up a new pod when a deployment's replicas field is unsatisfied).

1.	Kube-apiserver
The API server is a component of the Kubernetes control plane that exposes the Kubernetes API. The API server is the front end for the Kubernetes control plane.
The main implementation of a Kubernetes API server is kube-apiserver. kube-apiserver is designed to scale horizontally—that is, it scales by deploying more instances. You can run several instances of kube-apiserver and balance traffic between those instances. kube-apiserver and balance traffic between those instances.

2.	etcd
	
Consistent and highly-available key value store used as Kubernetes' backing store for all cluster data. If your Kubernetes cluster uses etcd as its backing store, make sure you have a backup plan for the data. You can find in-depth information about etcd in the official documentation.

3.	kube-scheduler
   
Control plane component that watches for newly created Pods with no assigned node, and selects a node for them to run on.
Factors taken into account for scheduling decisions include: individual and collective resource requirements, hardware/software/policy constraints, affinity and anti-affinity specifications, data locality, inter-workload interference, and deadlines.

4.	kube-controller-manager

Control plane component that runs controller processes.
Logically, each controller is a separate process, but to reduce complexity, they are all compiled into a single binary and run in a single process.
There are many different types of controllers. Some examples of them are:
-->	Node controller: Responsible for noticing and responding when nodes go down.
--> Job controller: Watches for Job objects that represent one-off tasks, then creates Pods to run those tasks to completion.
--> Endpoint Slice controller: Populates Endpoint Slice objects (to provide a link between Services and Pods).
--> Service Account controller: Create default Service Accounts for new namespaces.
The above is not an exhaustive list.




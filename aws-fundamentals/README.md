## AWS Fundamentals ##
## Cloud Practitioner Essentials ##
`What is Cloud Computing`

Cloud computing is the delivery of on-demand computing services over the internet on a pay-as-you-go basis. It offers the online data storage, Infrastructure and application.

<img width="359" alt="cloud-computing" src="https://github.com/viswa2/devops/assets/34201574/816eb632-2e32-44c6-b0f6-1020d7646aba">

Cloud computing offers platform independency, as the software is not required to be installed locally on the PC. Hence, the Cloud Computing is making our business applications mobile and collaborative.

Types of cloud computing model:
1.	Deployment Model
2.	Service Model

Types of Cloud Deployment Model:

1.	Public Cloud: The Cloud infrastructure is made available to general public over the internet and by cloud provider.
 `Ex:` - AWS, Azure, IBM’s Blue cloud and sun cloud
2.	Private Cloud: This Cloud Infrastructure Is Exclusively operated by a single organization. It can be managed by organization or third party and may exist on-premises or off-premises.
`Ex:`` - AWS, VMware
3.	Hybrid Cloud: It’s Consists of both Public and Private cloud
Ex: - Federal agencies opt for private clouds when sensitive information is involved. Also, they use the public cloud to share the datasets with the general public or other government departments.

`Types of Service Model`
1.	IAAS
2.	PAAS
3.	SAAS

      <img width="383" alt="Iaas vs Paas vs Saas " src="https://github.com/viswa2/devops/assets/34201574/e84f94d5-5b95-4e8f-8f10-11840939d3e3">

`IAAS:`
Infrastructure-as-a-service, or IaaS, is a step away from on-premises infrastructure. It’s a pay-as-you-go service where a third party provides you with infrastructure services, like storage and virtualization, as you need them, via a cloud, through the internet. 

As the user, you are responsible for the operating system and any data, applications, middleware, and runtimes, but a provider gives you access to, and management of, the network, servers, virtualization, and storage you need. 

You don’t have to maintain or update your own on-site datacenter because the provider does it for you. Instead, you access and control the infrastructure via an application programming interface (API) or dashboard. 

IaaS gives you flexibility to purchase only the components you need and scale them up or down as needed. There’s low overhead and no maintenance costs, making IaaS a very affordable option. 

One way to use IaaS would be as a quick, flexible way to build up and take down and development and testing environments. You can use only the infrastructure you need to create your development environment—and scale it up or down—for as long as you need it, and then you can stop when you’re finished, paying only for what you use. 

The main drawbacks to IaaS are the possibilities of provider security issues, multi-tenant systems where the provider must share infrastructure resources with multiple clients, and service reliability. These drawbacks can be avoided by choosing a reliable and trustworthy provider with a solid history and reputation.

`EX:` Public cloud providers such as AWS, Microsoft Azure, and Google Cloud are examples of IaaS.

`PAAS:`
Platform-as-a-service (PaaS) is another step further from full, on-premises infrastructure management. It is where a provider hosts the hardware and software on its own infrastructure and delivers this platform to the user as an integrated solution, solution stack, or service through an internet connection.

Primarily useful for developers and programmers, PaaS allows the user to develop, run, and manage their own apps without having to build and maintain the infrastructure or platform usually associated with the process. 
You write the code, build, and manage your apps, but you do it without the headaches of software updates or hardware maintenance. The environment to build and deploy is provided for you. 
PaaS is a way that developers can create a framework to build and customize their web-based applications on. Developers can use built-in software components to create their applications, which cuts down on the amount of code they must write themselves.
`EX:` A few examples of PaaS are AWS Elastic Beanstalk, Heroku, and Red Hat OpenShift.

`SAAS:`
Software-as-a-service (SaaS), also known as cloud application services, is the most comprehensive form of cloud computing services, delivering an entire application that is managed by a provider, via a web browser. 
Software updates, bug fixes, and general software maintenance are handled by the provider and the user connects to the app via a dashboard or API. There’s no installation of the software on individual machines and group access to the program is smoother and more reliable. 
You’re already familiar with a form of SaaS if you have an email account with a web-based service like Outlook or Gmail, for example, as you can log into your account and get your email from any computer, anywhere. 
SaaS is a great option for small businesses who don’t have the staff or bandwidth to handle software installation and updates, as well as for applications that don’t require much customization or that will only be used periodically. 
What SaaS saves you in time and maintenance, however, it could cost you in control, security, and performance, so it’s important to choose a provider you can trust.

`EX:` Dropbox, Salesforce, Google Apps, and Red Hat Insights are some examples of SaaS. 

`Reference Link:` IaaS vs PaaS vs SaaS (redhat.com)

``Cloud Computing Services:``

`Compute:`
1.	AWS app Runner
2.	Batch
3.	EC2
4.	EC2 Image Builder
5.	Elastic Beanstalk
6.	Lambda
7.	Lightsail
   
`Storage:`
1.	AWS Backup
2.	EFS
3.	AWS Elastic Disaster Recovery
4.	S3
5.	S3 Glacier
6.	Storage Gateway
   
`Networking & Content delivery:`
1.	API Gateway
2.	AWS Cloud map
3.	CloudFront
4.	Direct Connect
5.	Route53
6.	VPC

`Security, Identify & Compliance`
1.	Artifact
2.	AWS Audit Manager
3.	Certificate Manager
4.	AWS Firewall Manager
5.	IAM
6.	Inspector
7.	Key Management Service
8.	Secret Manager
9.	AWS Single Sign-On

`Containers:`
1.	Elastic Container Registry (ECR)
2.	Elastic Container Service (ECS)
3.	Elastic Kubernetes Service (EKS)
4.	Red Hat Openshift Service on AWS
   
`Database:`
1.	Amazon Document DB
2.	DynamoDB
3.	ElasticCache
4.	Amazon Memory DB for Redis
5.	RDS
   
`Developer Tools:`
1.	Cloud9
2.	CloudShell
3.	CodeAtrifact
4.	CodeBuild
5.	CodeCommit
6.	CodeDeploy
7.	CodePipeline

`AWS Regions VS Availability Zones`

Global Infrastructure and reliability:

`Availability Zones:`

An Availability Zone is a single data centre or a group of data canters within a Region. Availability Zones are located tens of miles apart from each other. This is close enough to have low latency (the time between when content requested and received) between Availability Zones. However, if a disaster occurs in one part of the Region, they are distant enough to reduce the chance that multiple Availability Zones are affected.

`Region:`

Regions are geographically isolated areas, where you can access services needed to run your enterprise. A Region consists of two or more Availability Zones.

For example: the South America (São Paulo) Region is sa-east-1. It includes three Availability Zones: sa-east-1a, sa-east-1b, and sa-east-1c.

Reference Link: Global Infrastructure Regions & AZs (amazon.com)

`Amazon EC2 (Elastic Compute Cloud):`

Amazon EC2 is a web service that provides secure, resizable compute capacity in the cloud. With this service, you can provision virtual servers called EC2 instances. 

Amazon EC2 instance you can use a virtual server to run applications in the AWS Cloud.
•	you can provision and launch an Amazon EC2 instance within minutes.
•	You can stop using it when you have finished running a workload.
•	You pay only for the compute time you use when an instance is running, not when it is stopped or terminated.
•	You can save costs by paying only for server capacity that you need or want.

To create an EC2 instance, you must define the following:

• Hardware specifications: CPU, memory, network, and storage

• Logical configurations: Networking location, firewall rules, authentication, and the operating system of your choice.

## Amazon Machine Image ##

When launching an EC2 instance, the first setting you configure is which operating system you want by selecting an Amazon Machine Image (AMI).

In the traditional infrastructure world, spinning up a server consists of installing an operating system from installation disks, drives, or wizards over the network. In the AWS Cloud, the operating system installation is not your responsibility. Instead, it's built into the AMI that you choose.

An AMI includes the operating system, storage mapping, architecture type, launch permissions, and any additional preinstalled software applications.

Each AMI in the AWS Management Console has an AMI ID, which is prefixed by ami-, followed by a random hash of numbers and letters. The IDs are unique to each AWS Region.

<img width="873" alt="AMI" src="https://github.com/viswa2/devops/assets/34201574/c703fb96-7b6b-4108-9a60-a569d77a567e">

## Different type of Ec2 Instances ##
When selecting an instance type, consider the specific needs of your workloads and applications. This might include requirements for compute, memory, or storage capabilities.

`General Purpose Instances:`

General purpose instances provide a balance of compute, memory, and networking resources. You can use them for a variety of workloads, such as:
•	application servers
•	gaming servers
•	backend servers for enterprise applications
•	small and medium databases
Suppose that you have an application in which the resource needs for compute, memory, and networking are roughly equivalent. You might consider running it on a general-purpose instance because the application does not require optimization in any single resource area.

`Compute Optimized Instances:`

Are ideal for compute-bound applications that benefit from high-performance processors. Like general purpose instances, you can use compute optimized instances for workloads such as web, application, and gaming servers.
However, the difference is computing optimized applications are ideal for high-performance web servers, compute-intensive applications servers, and dedicated gaming servers. You can also use compute optimized instances for batch processing workloads that require processing many transactions in a single group.

`Memory Optimized Instances:`

Are designed to deliver fast performance for workloads that process large datasets in memory. In computing, memory is a temporary storage area. It holds all the data and instructions that a central processing unit (CPU) needs to be able to complete actions. Before a computer program or application can run, it is loaded from storage into memory. This preloading process gives the CPU direct access to the computer program.

Suppose that you have a workload that requires large amounts of data to be preloaded before running an application. This scenario might be a high-performance database or a workload that involves performing real-time processing of a large amount of unstructured data. In these types of use cases, consider using a memory optimized instance. Memory optimized instances enable you to run workloads with high memory needs and receive great performance.

`Accelerated Computing Instances:' 
Use hardware accelerators, or coprocessors, to perform some functions more efficiently than is possible in software running on CPUs. Examples of these functions include floating-point number calculations, graphics processing, and data pattern matching.

In computing, a hardware accelerator is a component that can expedite data processing. Accelerated computing instances are ideal for workloads such as graphics applications, game streaming, and application streaming.

`Storage Optimized Instances:`

Are designed for workloads that require high, sequential read and write access to large datasets on local storage. Examples of workloads suitable for storage optimized instances include distributed file systems, data warehousing applications, and high-frequency online transaction processing (OLTP) systems.

In computing, the term input/output operations per second (IOPS) is a metric that measures the performance of a storage device. It indicates how many different input or output operations a device can perform in one second. Storage optimized instances are designed to deliver tens of thousands of low-latencies, random IOPS to applications. 

You can think of input operations as data put into a system, such as records entered a database. An output operation is data generated by a server. An example of output might be the analytics performed on the records in a database. If you have an application that has a high IOPS requirement, a storage optimized instance can provide better performance over other instance types not optimized for this kind of use case.

![Ec2-Instance-Type](https://github.com/viswa2/devops/assets/34201574/49998160-ff77-4d5c-b0e7-0166428405fc)

## Ec2 Pricing ##

`On-Demand:`

On-Demand Instances are ideal for short-term, irregular workloads that cannot be interrupted. No upfront costs or minimum contracts apply. The instances run continuously until you stop them, and you pay for only the compute time you use.

Sample use cases for On-Demand Instances include developing and testing applications and running applications that have unpredictable usage patterns. On-Demand Instances are not recommended for workloads that last a year or longer because these workloads can experience greater cost savings using Reserved Instances.

`Saving Plans:`

AWS offers Savings Plans for several compute services, including Amazon EC2. Amazon EC2 Savings Plans enable you to reduce your compute costs by committing to a consistent amount of compute usage for a 1-year or 3-year term. This term commitment results in savings of up to 72% over On-Demand costs.

Any usage up to the commitment is charged at the discounted Savings Plan rate (for example, $10 an hour). Any usage beyond the commitment is charged at regular On-Demand rates.

Later in this course, you will review AWS Cost Explorer, a tool that enables you to visualize, understand, and manage your AWS costs and usage over time. If you are considering your options for Savings Plans, AWS Cost Explorer can analyse your Amazon EC2 usage over the past 7, 30, or 60 days. AWS Cost Explorer also provides customized recommendations for Savings Plans. These recommendations estimate how much you could save on your monthly Amazon EC2 costs, based on previous Amazon EC2 usage and the hourly commitment amount in a 1-year or 3-year Savings Plan.

`Reserved Instances:`

Reserved Instances are a billing discount applied to the use of On-Demand Instances in your account. You can purchase Standard Reserved and Convertible Reserved Instances for a 1-year or 3-year term and Scheduled Reserved Instances for a 1-year term. You realize greater cost savings with the 3-year option.

At the end of a Reserved Instance term, you can continue using the Amazon EC2 instance without interruption. However, you are charged On-Demand rates until you do one of the following:
•	Terminate the instance.
•	Purchase a new Reserved Instance that matches the instance attributes (instance type, Region, tenancy, and platform).

`Spot Instances:`

Spot Instances are ideal for workloads with flexible start and end times, or that can withstand interruptions. Spot Instances use unused Amazon EC2 computing capacity and offer you cost savings at up to 90% off On-Demand prices.

Suppose that you have a background processing job that can start and stop as needed (such as the data processing job for a customer survey). You want to start and stop the processing job without affecting the overall operations of your business. If you make a Spot request and Amazon EC2 capacity is available, your Spot Instance launches. However, if you make a Spot request and Amazon EC2 capacity is unavailable, the request is not successful until capacity becomes available. The unavailable capacity might delay the launch of your background processing job.

After you have launched a Spot Instance, if capacity is no longer available or demand for Spot Instances increases, your instance may be interrupted. This might not pose any issues for your background processing job. However, in the earlier example of developing and testing applications, you would most likely want to avoid unexpected interruptions. Therefore, choose a different EC2 instance type that is ideal for those tasks.

`Dedicated Hosts:`

Dedicated Hosts are physical servers with Amazon EC2 instance capacity that is fully dedicated to your use. 

You can use your existing per-socket, per-core, or per-VM software licenses to help maintain license compliance. You can purchase On-Demand Dedicated Hosts and Dedicated Hosts Reservations. Of all the Amazon EC2 options that were covered, Dedicated Hosts are the most expensive.

## Amazon EC2 instance types ##

EC2 instances are a combination of virtual processors (vCPUs), memory, network, and, in some cases, instance storage and graphics processing units (GPUs). When you create an EC2 instance, you need to choose how much you need of each of these components.

`EX:` t2.micro, t2.medium, t2.large, t3.nano, t3.small, t3.large, a1.medium, a1.large etc.

<img width="920" alt="Instance-types" src="https://github.com/viswa2/devops/assets/34201574/56812bf9-a2f3-4e8c-b653-5b7ff8270ab9">

## EC2 instance lifecycle ##

An EC2 instance transitions between different states from the moment you create it until its termination.

<img width="944" alt="EC2-Instance-Lifecycle" src="https://github.com/viswa2/devops/assets/34201574/d788235d-fc85-4697-a5ad-5f632e0be755">

1. When you launch an instance, it enters the pending state. When an instance is pending, billing has not started. At this stage, the instance is preparing to enter the running state. Pending is where AWS performs all actions needed to set up an instance, such as copying the AMI content to the root device and allocating the necessary networking components.
   
2. When your instance is running, it's ready to use. This is also the stage where billing begins. As soon as an instance is running, you can take other actions on the instance, such as reboot, terminate, stop, and stop-hibernate.
   
3. When you reboot an instance, it’s different than performing a stop action and then a start action. Rebooting an instance is equivalent to rebooting an operating system. The instance keeps its public DNS name (IPv4) and private and public IPv4 addresses. An IPv6 address (if applicable) remains on the same host computer and maintains its public and private IP address, in addition to any data on its instance store volumes.

4. When you stop your instance, it enters the stopping and then stopped state. This is similar to when you shut down your laptop. You can stop and start an instance if it has an Amazon Elastic Block Store (Amazon EBS) volume as its root device. When you stop and start an instance, your instance can be placed on a new underlying physical server. Your instance retains its private IPv4 addresses and if your instance has an IPv6 address, it retains its IPv6 address. When you put the instance into stop-hibernate, the instance enters the stopped state, but saves the last information or content into memory, so that the start process is faster.

5. When you terminate an instance, the instance stores are erased, and you lose both the public IP address and private IP address of the machine. Termination of an instance means that you can no longer access the machine. As soon as the status of an instance changes to shutting down or terminated, you stop incurring charges for that instance.

## Difference between stop and stop-hibernate ##

When you stop an instance, it enters the stopping state until it reaches the stopped state. AWS does not charge usage or data transfer fees for your instance after you stop it. But storage for any Amazon EBS volumes is still charged. While your instance is in the stopped state, you can modify some attributes, like the instance type. When you stop your instance, the data from the instance memory (RAM) is lost.

When you stop-hibernate an instance, Amazon EC2 signals the operating system to perform hibernation (suspend-to-disk), which saves the contents from the instance memory (RAM) to the EBS root volume. You can hibernate an instance only if hibernation is turned on and the instance meets the hibernation prerequisites.

## Amazon EC2 Auto Scaling ##

If you’ve tried to access a website that wouldn’t load and frequently timed out, the website might have received more requests than it was able to handle. This situation is like waiting in a long line at a coffee shop, when there is only one barista present to take orders from customers.
Amazon EC2 Auto Scaling enables you to automatically add or remove Amazon EC2 instances in response to changing application demand. By automatically scaling your instances in and out as needed, you can maintain a greater sense of application availability.

Within Amazon EC2 Auto Scaling, you can use two approaches: dynamic scaling and predictive scaling.
•	Dynamic scaling responds to changing demand. 
•	Predictive scaling automatically schedules the right number of Amazon EC2 instances based on predicted demand.
`Note:` To scale faster, you can use dynamic and predictive scaling faster.

`Example: Amazon EC2 Auto Scaling`

In the cloud, computing power is a programmatic resource, so you can take a more flexible approach to the issue of scaling. By adding Amazon EC2 Auto Scaling to an application, you can add new instances to the application when necessary and terminate them when no longer needed.
Suppose that you are preparing to launch an application on Amazon EC2 instances. When configuring the size of your Auto Scaling group, you might set the minimum number of Amazon EC2 instances at one. This always means that, there must be at least one Amazon EC2 instance running.

![Autoscaling-Group](https://github.com/viswa2/devops/assets/34201574/ed08d40b-3287-423f-bfc9-5f1957a3360b)

When you create an Auto Scaling group, you can set the minimum number of Amazon EC2 instances. The minimum capacity is the number of Amazon EC2 instances that launch immediately after you have created the Auto Scaling group. In this example, the Auto Scaling group has a minimum capacity of one Amazon EC2 instance.

Next, you can set the desired capacity at two Amazon EC2 instances even though your application needs a minimum of a single Amazon EC2 instance to run.

`Note:` If you do not specify the desired number of Amazon EC2 instances in an Auto Scaling group, the desired capacity defaults to your minimum capacity.

The third configuration that you can set in an Auto Scaling group is the maximum capacity. For example, you might configure the Auto Scaling group to scale out in response to increased demand, but only to a maximum of four Amazon EC2 instances.
Because Amazon EC2 Auto Scaling uses Amazon EC2 instances, you pay for only the instances you use when you use them. You now have a cost-effective architecture that provides the best customer experience while reducing expenses.

## Elastic Load Balancing ##

Elastic Load Balancing is the AWS service that automatically distributes incoming application traffic across multiple resources, such as Amazon EC2 instances.

A load balancer acts as a single point of contact for all incoming web traffic to your Auto Scaling group. This means that as you add or remove Amazon EC2 instances in response to the amount of incoming traffic, these requests route to the load balancer first. Then, the requests spread across multiple resources that will handle them. For example, if you have multiple Amazon EC2 instances, Elastic Load Balancing distributes the workload across the multiple instances so that no single instance must carry the bulk of it.

Although Elastic Load Balancing and Amazon EC2 Auto Scaling are separate services, they work together to help ensure that applications running in Amazon EC2 can provide high performance and availability.

`Example: Elastic Load Balancing`

![Load-Balancing](https://github.com/viswa2/devops/assets/34201574/16eb6fca-f76b-4eb6-be96-483b1acf64c1)

`Low-demand period:`

Here’s an example of how Elastic Load Balancing works. Suppose that a few customers have come to the coffee shop and are ready to place their orders. 
If only a few registers are open, this matches the demand of customers who need service. The coffee shop is less likely to have open registers with no customers. In this example, you can think of the registers as Amazon EC2 instances.

![Load-balancing-Demand](https://github.com/viswa2/devops/assets/34201574/fc85e34e-87f3-496c-b416-93aada184f74)

`High-demand period:`

Throughout the day, as the number of customers increases, the coffee shop opens more registers to accommodate them. In the diagram, the Auto Scaling group represents this. Additionally, a coffee shop employee directs customers to the most appropriate register so that the number of requests can evenly distribute across the open registers. You can think of this coffee shop employee as a load balancer. 

`Amazon Simple Notification Service (Amazon SNS)`

Amazon Simple Notification Service (Amazon SNS) is a publish/subscribe service. Using Amazon SNS topics, a publisher publishes messages to subscribers. This is like the coffee shop; the cashier provides coffee orders to the barista who makes the drinks.
In Amazon SNS, subscribers can be web servers, email addresses, AWS Lambda functions, or several other options.

`Amazon Simple Queue Service (Amazon SQS)`

Amazon Simple Queue Service (Amazon SQS) is a message queuing service. Using Amazon SQS, you can send, store, and receive messages between software components, without losing messages or requiring other services to be available. In Amazon SQS, an application sends messages into a queue. A user or service retrieves a message from the queue, processes it, and then deletes it from the queue.

Example: Amazon SQS
Example: Fulfilling an order

<img width="452" alt="SQS" src="https://github.com/viswa2/devops/assets/34201574/8fddcca0-25cb-4416-987c-b5327fd55c8d">

Suppose that the coffee shop has an ordering process in which a cashier takes orders, and a barista makes the orders. Think of the cashier and the barista as two separate components of an application. 
First, the cashier takes an order and writes it down on a piece of paper. Next, the cashier delivers the paper to the barista. Finally, the barista makes the drink and gives it to the customer.
When the next order comes in, the process repeats. This process runs smoothly as long as both the cashier and the barista are coordinated.
What might happen if the cashier took an order and went to deliver it to the barista, but the barista was out on a break or busy with another order? The cashier would need to wait until the barista is ready to accept the order. This would cause delays in the ordering process and require customers to wait longer to receive their orders.

As the coffee shop has become more popular and the ordering line is moving more slowly, the owners notice that the current ordering process is time consuming and inefficient. They decide to try a different approach that uses a queue.

`Example:` Orders in a queue

![OrdersinQue](https://github.com/viswa2/devops/assets/34201574/2771d195-d915-4a7d-8ce8-2aa94d9d66b2)

Recall that the cashier and the barista are two separate components of an application. A message queuing service such as Amazon SQS enables messages between decoupled application complements.

In this example, the first step in the process remains the same as before: a customer places an order with the cashier. 

The cashier puts the order into a queue. You can think of this as an order board that serves as a buffer between the cashier and the barista. Even if the barista is out on a break or busy with another order, the cashier can continue placing new orders into the queue. 
Next, the barista checks the queue and retrieves the order. The barista prepares the drink and gives it to the customer. The barista then removes the completed order from the queue.
While the barista is preparing the drink, the cashier can continue taking new orders and add them to the queue.
For decoupled applications and microservices, Amazon SQS enables you to send, store, and retrieve messages between components. 
This decoupled approach enables the separate components to work more efficiently and independently. 

## Serverless computing ##

Earlier in this module, you learned about Amazon EC2, a service that lets you run virtual servers in the cloud. If you have applications that you want to run in Amazon EC2, you must do the following:
    1. Provision instances (virtual servers).
    2. Upload your code. 
 	  3. Continue to manage the instances while your application is running.
    
• The term “serverless” means that your code runs on servers, but you do not need to provision or manage these servers. With serverless computing, you can focus more on innovating new products and features instead of maintaining servers.
• Another benefit of serverless computing is the flexibility to scale serverless applications automatically. Serverless computing can adjust the applications' capacity by modifying the units of consumptions, such as throughput and memory. 
• An AWS service for serverless computing is AWS Lambda.

## AWS Lambda ##

AWS Lambda is a service that lets you run code without needing to provision or manage servers. 
While using AWS Lambda, you pay only for the compute time that you consume. Charges apply only when your code is running. You can also run code for virtually any type of application or backend service, all with zero administration. 
For example, a simple Lambda function might involve automatically resizing uploaded images to the AWS Cloud. In this case, the function triggers when uploading a new image. 

## How AWS Lambda works ##

<img width="452" alt="Lambda" src="https://github.com/viswa2/devops/assets/34201574/8deb95ca-d85f-41e5-9675-8495b4023f0e">

1.	You upload your code to Lambda. 

2.	You set your code to trigger from an event source, such as AWS services, mobile applications, or HTTP endpoints.
3.	Lambda runs your code only when triggered.

4.	You pay only for the compute time that you use. In the previous example of resizing images, you would pay only for the compute time that you use when uploading new images. Uploading the images triggers Lambda to run code for the image resizing function.

## Edge locations ##

An edge location is a site that Amazon CloudFront uses to store cached copies of your content closer to your customers for faster delivery.

## AWS Elastic Beanstalk ##

With AWS Elastic Beanstalk, you provide code and configuration settings, and Elastic Beanstalk deploys the resources necessary to perform the following tasks:
•	Adjust capacity.
•	Load balancing
•	Automatic scaling
•	Application health monitoring

## AWS CloudFormation ##

•	With AWS CloudFormation, you can treat your infrastructure as code. This means that you can build an environment by writing lines of code instead of using the AWS Management Console to individually provision resources.
•	AWS CloudFormation provisions your resources in a safe, repeatable manner, enabling you to frequently build your infrastructure and applications without having to perform manual actions. It determines the right operations to perform when managing your stack and rolls back changes automatically if it detects errors.

## Networking ##

Amazon Virtual Private Cloud (Amazon VPC)
A networking service that you can use to establish boundaries around your AWS resources is Amazon Virtual Private Cloud (Amazon VPC).
Amazon VPC enables you to provision an isolated section of the AWS Cloud. In this isolated section, you can launch resources in a virtual network that you define. Within a virtual private cloud (VPC), you can organize your resources into subnets. A subnet is a section of a VPC that can contain resources such as Amazon EC2 instances.

`Note:` An Amazon Virtual Private Cloud (Amazon VPC) spans all of the Availability Zones (AZ) in the Region whereas a subnet spans only one Availability Zone (AZ) in the Region

## Internet gateway ##

To allow public traffic from the internet to access your VPC, you attach an internet gateway to the VPC.

An internet gateway is a connection between a VPC and the internet. You can think of an internet gateway as being like a doorway that customers use to enter the coffee shop. Without an internet gateway, no one can access the resources within your VPC.

<img width="452" alt="Internet-Gateway" src="https://github.com/viswa2/devops/assets/34201574/fd919a4f-d9a7-442a-a95d-2bb5e43d98fa">

`What if you have a VPC that includes only private resources?`

## Virtual private gateway ##
To access private resources in a VPC, you can use a virtual private gateway. 
Here’s an example of how a virtual private gateway works. You can think of the internet as the road between your home and the coffee shop. Suppose that you are traveling on this road with a bodyguard to protect you. You are still using the same road as other customers, but with an extra layer of protection. 

The bodyguard is like a virtual private network (VPN) connection that encrypts (or protects) your internet traffic from all the other requests around it. 
The virtual private gateway is the component that allows protected internet traffic to enter the VPC. Even though your connection to the coffee shop has extra protection, traffic jams are possible because you’re using the same road as other customers. 

<img width="452" alt="VPG" src="https://github.com/viswa2/devops/assets/34201574/a012decd-9f79-4898-b0a2-bb2bd14ec5f9">

`A virtual private` gateway enables you to establish a virtual private network (VPN) connection between your VPC and a private network, such as an on-premises data centre or internal corporate network. A virtual private gateway allows traffic into the VPC only if it is coming from an approved network.

## AWS Direct Connect ##
AWS Direct Connect is a service that enables you to establish a dedicated private connection between your data centre and a VPC.  
Suppose that there is an apartment building with a hallway directly linking the building to the coffee shop. Only the residents of the apartment building can travel through this hallway. 
This private hallway provides the same type of dedicated connection as AWS Direct Connect. Residents can get into the coffee shop without needing to use the public road shared with other customers.

<img width="452" alt="Vpc" src="https://github.com/viswa2/devops/assets/34201574/278ec920-33cd-4ca3-bbc7-a25093ff5044">

The private connection that AWS Direct Connect provides helps you to reduce network costs and increase the amount of bandwidth that can travel through your network.

## Subnets ##
A subnet is a section of a VPC in which you can group resources based on security or operational needs. Subnets can be public or private.

<img width="431" alt="Subnet" src="https://github.com/viswa2/devops/assets/34201574/dffd2503-486b-4922-bcab-7fa724609312">

`Public subnets` contain resources that need to be accessible by the public, such as an online store’s website.

`Private subnets` contain resources that should be accessible only through your private network, such as a database that contains customers’ personal information and order histories. 
In a VPC, subnets can communicate with each other. For example, you might have an application that involves Amazon EC2 instances in a public subnet communicating with databases that are in a private subnet. The public subnet can communicate with the private subnet because the CIDR of the private subnet falls within the local route of the route table associated with the public subnet.

## Network traffic in a VPC ##

When a customer requests data from an application hosted in the AWS Cloud, this request is sent as a packet. A packet is a unit of data sent over the internet or a network. 
It enters a VPC through an internet gateway. Before a packet can enter a subnet or exit from a subnet, it checks for permissions. These permissions indicate who sent the packet and how the packet is trying to communicate with the resources in a subnet.
The VPC component that checks packet permissions for subnets is a network access control list (ACL).

## Network access control lists (ACLs) ##

A network access control list (ACL) is a virtual firewall that controls inbound and outbound traffic at the subnet level. It is stateless and allows all inbound and outbound traffic.
For example, step outside of the coffee shop and imagine that you are in an airport. In the airport, travelers are trying to enter a different country. You can think of the travellers as packets and the passport control officer as a network ACL. The passport control officer checks travelers’ credentials when they are both entering and exiting out of the country. If a traveler is on an approved list, they can get through. However, if they are not on the approved list or are explicitly on a list of banned travelers, they cannot come in.
  
<img width="419" alt="NACL" src="https://github.com/viswa2/devops/assets/34201574/af446d10-18cf-45a4-a2ca-40b1fcdc7943">

`Reference Link:` https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html

Each AWS account includes a default network ACL. When configuring your VPC, you can use your account’s default network ACL or create custom network ACLs. 
By default, your account’s default network ACL allows all inbound and outbound traffic, but you can modify it by adding your own rules. For custom network ACLs, all inbound and outbound traffic is denied until you add rules to specify which traffic to allow. Additionally, all network ACLs have an explicit deny rule. This rule ensures that if a packet doesn’t match any of the other rules on the list, the packet is denied.

## Security Groups ##

`Security groups` A security group is a virtual firewall that controls inbound and outbound traffic for an Amazon EC2 instance.

<img width="360" alt="Security-Group" src="https://github.com/viswa2/devops/assets/34201574/bd5e5012-35a2-463d-97ec-a1426320fc19">

By default, a security group denies all inbound traffic and allows all outbound traffic. You can add custom rules to configure which traffic to allow or deny.
For this example, suppose that you are in an apartment building with a door attendant who greets guests in the lobby. 
You can think of the guests as packets and the door attendant as a security group. As guests arrive, the door attendant checks a list to ensure they can enter the building. However, the door attendant does not check the list again when guests are exiting the building.

If you have multiple Amazon EC2 instances within a subnet, you can associate them with the same security group or use different security groups for each instance. 

`Note:` Security Group acts as a firewall at the instance level whereas Network Access Control List (Network ACL) acts as a firewall at the subnet level

In the following, match each part of the application to the correct VPC component.

![VPC-Component](https://github.com/viswa2/devops/assets/34201574/c4ea93f0-5a8c-4ea3-a251-0a4cc134f4ae)

## Domain Name System (DNS) ##

Suppose that any Company has a website hosted in the AWS Cloud. Customers enter the web address into their browser, and they can access the website. This happens because of Domain Name System (DNS) resolution. DNS resolution involves a customer DNS resolver communicating with a company DNS server.
You can think of DNS as being the phone book of the internet. DNS resolution is the process of translating a domain name to an IP address. 

<img width="452" alt="DNS" src="https://github.com/viswa2/devops/assets/34201574/2ad73ec0-d781-4054-9856-e427ebc9743f">

For example, suppose that you want to visit AnyCompany’s website. 

1.	When you enter the domain name into your browser, this request is sent to a customer DNS resolver. 
2.	The customer DNS resolver asks the company DNS server for the IP address that corresponds to AnyCompany’s website.
3.	The company DNS server responds by providing the IP address for AnyCompany’s website, 192.0.2.0.

## Amazon Route 53 ##

Amazon Route 53 is a DNS web service. It gives developers and businesses a reliable way to route end users to internet applications hosted in AWS. 
Amazon Route 53 connects user requests to infrastructure running in AWS (such as Amazon EC2 instances and load balancers). It can route users to infrastructure outside of AWS.
Another feature of Route 53 is the ability to manage the DNS records for domain names. You can register new domain names directly in Route 53. You can also transfer DNS records for existing domain names managed by other domain registrars. This enables you to manage all your domain names within a single location.

`Note:` Features are available with Route53 i.e Domain Registrations, DNS, Health checks, Routing Policy.

In the previous module, you learned about Amazon CloudFront, a content delivery service. The following example describes how Route 53 and Amazon CloudFront work together to deliver content to customers.
`Example:` How Amazon Route 53 and Amazon CloudFront deliver content

<img width="452" alt="Route53" src="https://github.com/viswa2/devops/assets/34201574/ea3c0b6a-19a3-4a6e-85d6-6a16dc540e4c">

Suppose that any Company’s application is running on several Amazon EC2 instances. These instances are in an Auto Scaling group that attaches to an Application Load Balancer. 

1.	A customer requests data from the application by going to any Company’s website. 
2.	Amazon Route 53 uses DNS resolution to identify AnyCompany.com’s corresponding IP address, 192.0.2.0. This information is sent back to the customer. 
3.	The customer’s request is sent to the nearest edge location through Amazon CloudFront.
4.	Amazon CloudFront connects to the Application Load Balancer, which sends the incoming packet to an Amazon EC2 instance.

`Route53 Routing Policy:` https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html

## Storage and Database ##

Instance stores
Block-level storage volumes behave like physical hard drives.
An instance store provides temporary block-level storage for an Amazon EC2 instance. An instance store is disk storage that is physically attached to the host computer for an EC2 instance, and therefore has the same lifespan as the instance. When the instance is terminated, you lose any data in the instance store.

Ama![EBS](https://github.com/viswa2/devops/assets/34201574/fe1d890e-82df-4aef-b179-33b64b0bf19e)

`Amazon Elastic Block Store (Amazon EBS)` is a service that provides block-level storage volumes that you can use with Amazon EC2 instances. If you stop or terminate an Amazon EC2 instance, all the data on the attached EBS volume remains available.
To create an EBS volume, you define the configuration (such as volume size and type) and provision it. After you create an EBS volume, it can attach to an Amazon EC2 instance.
Because EBS volumes are for data that needs to persist, it’s important to back up the data. You can take incremental backups of EBS volumes by creating Amazon EBS snapshots.

`Note:` In the same AZ EC2 instance volume can be attached other AZ volume can't be attached to EC2  
      Once the EC2 instance is terminated by default volume should be deleted, because while creating EC2 instance `delete on termination is selected yes`

<img width="1383" alt="Block-Device-Volume" src="https://github.com/viswa2/DevOps/assets/34201574/2c7846d2-a924-44f0-9ac1-cd33eaa1e11d">

`Reference Link:` https://aws.amazon.com/ebs/

## Amazon EBS snapshots ##

An EBS snapshot is an incremental backup. This means that the first backup taken of a volume copy all the data. For subsequent backups, only the blocks of data that have changed since the most recent snapshot are saved. 
Incremental backups are different from full backups, in which all the data in a storage volume copies each time a backup occurs. The full backup includes data that has not changed since the most recent backup.

![EBS-Snapshot](https://github.com/viswa2/devops/assets/34201574/0b02b1d5-a11e-43c7-acb0-815a6cc8b745)

## Amazon Simple Storage Service (Amazon S3) or Object Storage ##

![Object-Storage](https://github.com/viswa2/devops/assets/34201574/c2bd700d-fccc-499b-a0ce-205718d4a1cc)

In object storage, each object consists of data, metadata, and a key.
The data might be an image, video, text document, or any other type of file. Metadata contains information about what the data is, how it is used, the object size, and so on. An object’s key is its unique identifier.

`Note:` Recall that when you modify a file in block storage, only the pieces that are changed are updated. When a file in object storage is modified, the entire object is updated.

## Amazon Simple Storage Service (Amazon S3) ##

Amazon Simple Storage Service (Amazon S3) is a service that provides object-level storage. Amazon S3 stores data as objects in buckets.
You can upload any type of file to Amazon S3, such as images, videos, text files, and so on. For example, you might use Amazon S3 to store backup files, media files for a website, or archived documents. Amazon S3 offers unlimited storage space. The maximum file size for an object in Amazon S3 is 5 TB.
When you upload a file to Amazon S3, you can set permissions to control visibility and access to it. You can also use the Amazon S3 versioning feature to track changes to your objects over time.

## Amazon S3 storage classes ##

With Amazon S3, you pay only for what you use. You can choose from a range of storage classes to select a fit for your business and cost needs. When selecting an Amazon S3 storage class, consider these two factors:

•	How often you plan to retrieve your data.
•	How available you need your data to be.
To learn more about the Amazon S3 storage classes select the + symbol next to each category.

`Amazon S3 Standard`

•	Designed for frequently accessed data.
•	Stores data in a minimum of three Availability Zones
Amazon S3 Standard provides high availability for objects. This makes it a good choice for a wide range of use cases, such as websites, content distribution, and data analytics. Amazon S3 Standard has a higher cost than other storage classes intended for infrequently accessed data and archival storage.

`Amazon S3 Standard-Infrequent Access (S3 Standard-IA)`

•	Ideal for infrequently accessed data.
•	Like Amazon S3 Standard but has a lower storage price and higher retrieval price.
Amazon S3 Standard-IA is ideal for data infrequently accessed but requires high availability when needed. Both Amazon S3 Standard and Amazon S3 Standard-IA store data in a minimum of three Availability Zones. Amazon S3 Standard-IA provides the same level of availability as Amazon S3 Standard but with a lower storage price and a higher retrieval price.

`Amazon S3 One Zone-Infrequent Access (S3 One Zone-IA)`

•	Stores data in a single Availability Zone
•	Has a lower storage price than Amazon S3 Standard-IA
Compared to Amazon S3 Standard and Amazon S3 Standard-IA, which store data in a minimum of three Availability Zones, Amazon S3 One Zone-IA stores data in a single Availability Zone. This makes it a good storage class to consider if the following conditions apply:
•	You want to save costs on storage.
•	You can easily reproduce your data in the event of an Availability Zone failure.

`Amazon S3 Intelligent-Tiering`

•	Ideal for data with unknown or changing access patterns.
•	Requires a small monthly monitoring and automation fee per object.
In the Amazon S3 Intelligent-Tiering storage class, Amazon S3 monitors objects’ access patterns. If you haven’t accessed an object for 30 consecutive days, Amazon S3 automatically moves it to the infrequent access tier, Amazon S3 Standard-IA. If you access an object in the infrequent access tier, Amazon S3 automatically moves it to the frequent access tier, Amazon S3 Standard.

`Amazon S3 Glacier Instant Retrieval`

•	Works well for archived data that requires immediate access.
•	Can retrieve objects within a few milliseconds.
When you decide between the options for archival storage, consider how quickly you must retrieve the archived objects. You can retrieve objects stored in the Amazon S3 Glacier Instant Retrieval storage class within milliseconds, with the same performance as Amazon S3 Standard.

`Amazon S3 Glacier Flexible Retrieval`

•	Low-cost storage designed for data archiving.
•	Able to retrieve objects within a few minutes to hours.
Amazon S3 Glacier Flexible Retrieval is a low-cost storage class that is ideal for data archiving. For example, you might use this storage class to store archived customer records or older photos and video files.

`Amazon S3 Glacier Deep Archive`

•	Lowest-cost object storage class ideal for archiving
•	Able to retrieve objects within 12 hours.
Amazon S3 Deep Archive supports long-term retention and digital preservation for data that might be accessed once or twice in a year. This storage class is the lowest-cost storage in the AWS Cloud, with data retrieval from 12 to 48 hours. All objects from this storage class are replicated and stored across at least three geographically dispersed Availability Zones.

`Amazon S3 Outposts`

•	Creates S3 buckets on Amazon S3 Outposts
•	Makes it easier to retrieve, store, and access data on AWS Outposts
Amazon S3 Outposts delivers object storage to your on-premises AWS Outposts environment. Amazon S3 Outposts is designed to store data durably and redundantly across multiple devices and servers on your Outposts. It works well for workloads with local data residency requirements that must satisfy demanding performance needs by keeping data close to on-premises applications.

Reference Links: https://aws.amazon.com/s3/storage-classes/

## Amazon Elastic File System (Amazon EFS) ##

`File storage`

In file storage, multiple clients (such as users, applications, servers, and so on) can access data that is stored in shared file folders. In this approach, a storage server uses block storage with a local file system to organize files. Clients access data through file paths.
Compared to block storage and object storage, file storage is ideal for use cases in which many services and resources need to access the same data at the same time.

`Amazon Elastic File System (Amazon EFS)` is a scalable file system used with AWS Cloud services and on-premises resources. As you add and remove files, Amazon EFS grows and shrinks automatically. It can scale on demand to petabytes without disrupting applications. 

## Amazon Relational Database Service (Amazon RDS) ##

In a relational database, data is stored in a way that relates it to other pieces of data. 
An example of a relational database might be the coffee shop’s inventory management system. Each record in the database would include data for a single item, such as product name, size, price, and so on.
Relational databases use structured query language (SQL) to store and query data. This approach allows data to be stored in an easily understandable, consistent, and scalable way. For example, the coffee shop owners can write a SQL query to identify all the customers whose most frequently purchased drink is a medium latte.

`Example of data in a relational database:`

ID	Product name	                Size	   Price
1	Medium roast ground coffee	    12 oz.	   $5.30
2	Dark roast ground coffee	    20 oz.	   $9.27

## Amazon Relational Database Service ##

`Amazon Relational Database Service (Amazon RDS)` is a service that enables you to run relational databases in the AWS Cloud.
Amazon RDS is a managed service that automates tasks such as hardware provisioning, database setup, patching, and backups. With these capabilities, you can spend less time completing administrative tasks and more time using data to innovate your applications. You can integrate Amazon RDS with other services to fulfil your business and operational needs, such as using AWS Lambda to query your database from a serverless application.

Amazon RDS provides several different security options. Many Amazon RDS database engines offer encryption at rest (protecting data while it is stored) and encryption in transit (protecting data while it is being sent and received).

## Amazon RDS database engines ##
Amazon RDS is available on six database engines, which optimize for memory, performance, or input/output (I/O). Supported database engines include:

•	Amazon Aurora
•	PostgreSQL
•	MySQL
•	MariaDB
•	Oracle Database
•	Microsoft SQL Server

## Amazon Aurora ##

Amazon Aurora is an enterprise-class relational database. It is compatible with MySQL and PostgreSQL relational databases. It is up to five times faster than standard MySQL databases and up to three times faster than standard PostgreSQL databases.
Amazon Aurora helps to reduce your database costs by reducing unnecessary input/output (I/O) operations, while ensuring that your database resources remain reliable and available. 
Consider Amazon Aurora if your workloads require high availability. It replicates six copies of your data across three Availability Zones and continuously backs up your data to Amazon S3.

## Amazon DynamoDB ##

Amazon DynamoDB is a key-value database service. It delivers single-digit millisecond performance at any scale. allows a database to have flexible schema and supports document data models

`Serverless:`

DynamoDB is serverless, which means that you do not have to provision, patch, or manage servers. 
You also do not have to install, maintain, or operate software. 

`Automatic Scaling:`

As the size of your database shrinks or grows, DynamoDB automatically scales to adjust for changes in capacity while maintaining consistent performance. 
This makes it a suitable choice for use cases that require high performance while scaling.

## Amazon Redshift ##

`Amazon Redshift` is a data warehousing service that you can use for big data analytics. It offers the ability to collect data from many sources and helps you to understand relationships and trends across your data.

## AWS Database Migration Service (AWS DMS) ##
`AWS Database Migration Service (AWS DMS)` enables you to migrate relational databases, nonrelational databases, and other types of data stores.
With AWS DMS, you move data between a source database and a target database. The source and target databases can be of the same type or different types. During the migration, your source database remains operational, reducing downtime for any applications that rely on the database.

For example, suppose that you have a MySQL database that is stored on premises in an Amazon EC2 instance or in Amazon RDS. Consider the MySQL database to be your source database. Using AWS DMS, you could migrate your data to a target database, such as an Amazon Aurora database.

## AWS Identity and Access Management (IAM) ##

AWS Identity and Access Management (IAM) enables you to manage access to AWS services and resources securely.   
IAM gives you the flexibility to configure access based on your company’s specific operational and security needs. You do this by using a combination of IAM features, which are explored in detail in this lesson:

•	IAM users, groups, and roles
•	IAM policies
•	Multi-factor authentication
You will also learn best practices for each of these features.

## AWS account root user ##

When you first create an AWS account, you begin with an identity known as the root user. 
The root user is accessed by signing in with the email address and password that you used to create your AWS account. You can think of the root user as being like the owner of the coffee shop. It has complete access to all the AWS services and resources in the account.

<img width="452" alt="AWS-Root-User" src="https://github.com/viswa2/devops/assets/34201574/063bf2c6-724e-4140-a191-b6212e3b9831">

`Best practice:`

Do not use the root user for everyday tasks. 
Instead, use the root user to create your first IAM user and assign it permissions to create other users.
Then, continue to create other IAM users, and access those identities for performing regular tasks throughout AWS. Only use the root user when you need to perform a limited number of tasks that are only available to the root user. Examples of these tasks include changing your root user email address and changing your AWS support plan.

## IAM users ##

An IAM user is an identity that you create in AWS. It represents the person or application that interacts with AWS services and resources. It consists of a name and credentials.
By default, when you create a new IAM user in AWS, it has no permissions associated with it. To allow the IAM user to perform specific actions in AWS, such as launching an Amazon EC2 instance or creating an Amazon S3 bucket, you must grant the IAM user the necessary permissions.

`Best practice:`

We recommend that you create individual IAM users for each person who needs to access AWS.  
Even if you have multiple employees who require the same level of access, you should create individual IAM users for each of them. This provides additional security by allowing each IAM user to have a unique set of security credentials.

## IAM policies ##

An IAM policy is a document that allows or denies permissions to AWS services and resources.  
IAM policies enable you to customize users’ levels of access to resources. For example, you can allow users to access all the Amazon S3 buckets within your AWS account, or only a specific bucket.

`Best practice:`

Follow the security principle of least privilege when granting permissions. 
By following this principle, you help to prevent users or roles from having more permissions than needed to perform their tasks. 
For example, if an employee needs access to only a specific bucket, specify the bucket in the IAM policy. Do this instead of granting the employee access to all of the buckets in your AWS account.

`Example: IAM policy`

Here’s an example of how IAM policies work. Suppose that the coffee shop owner has to create an IAM user for a newly hired cashier. The cashier needs access to the receipts kept in an Amazon S3 bucket with the ID: AWSDOC-EXAMPLE-BUCKET.

<img width="452" alt="Iam-Policy" src="https://github.com/viswa2/devops/assets/34201574/35c11938-a13a-4cda-9daa-874ce935ece7">

This example `IAM policy` allows permission to access the objects in the Amazon S3 bucket with ID: AWSDOC-EXAMPLE-BUCKET.

In this example, the IAM policy is allowing a specific action within Amazon S3: List Object. The policy also mentions a specific bucket ID: AWSDOC-EXAMPLE-BUCKET. When the owner attaches this policy to the cashier’s IAM user, it will allow the cashier to view all the objects in the AWSDOC-EXAMPLE-BUCKET bucket. 
If the owner wants the cashier to be able to access other services and perform other actions in AWS, the owner must attach additional policies to specify these services and actions.
Now, suppose that the coffee shop has hired a few more cashiers. Instead of assigning permissions to each individual IAM user, the owner places the users into an IAM group.

## IAM groups ##

An IAM group is a collection of IAM users. When you assign an IAM policy to a group, all users in the group are granted permissions specified by the policy.
Here’s an example of how this might work in the coffee shop. Instead of assigning permissions to cashiers one at a time, the owner can create a “Cashiers” IAM group. The owner can then add IAM users to the group and then attach permissions at the group level. 

<img width="443" alt="IAM-Group" src="https://github.com/viswa2/devops/assets/34201574/aca4d162-6afe-4a3f-919e-a96eda1d3f85">

Assigning IAM policies at the group level also makes it easier to adjust permissions when an employee transfers to a different job. For example, if a cashier becomes an inventory specialist, the coffee shop owner removes them from the “Cashiers” IAM group and adds them into the “Inventory Specialists” IAM group. This ensures that employees have only the permissions that are required for their current role.
What if a coffee shop employee hasn’t switched jobs permanently, but instead, rotates to different workstations throughout the day? This employee can get the access they need through IAM roles.

## IAM roles ##

In the coffee shop, an employee rotates to different workstations throughout the day. Depending on the staffing of the coffee shop, this employee might perform several duties: work at the cash register, update the inventory system, process online orders, and so on. 
When the employee needs to switch to a different task, they give up their access to one workstation and gain access to the next workstation. The employee can easily switch between workstations, but at any given point in time, they can have access to only a single workstation. This same concept exists in AWS with IAM roles.

An IAM role is an identity that you can assume to gain temporary access to permissions.  
Before an IAM user, application, or service can assume an IAM role, they must be granted permissions to switch to the role. When someone assumes an IAM role, they abandon all previous permissions that they had under a previous role and assume the permissions of the new role. 
Best practice: IAM roles are ideal for situations in which access to services or resources needs to be granted temporarily, instead of long-term.

## Multi-factor authentication ##

Have you ever signed into a website that required you to provide multiple pieces of information to verify your identity? You might have needed to provide your password and then a second form of authentication, such as a random code sent to your phone. This is an example of multi-factor authentication.
In IAM, multi-factor authentication (MFA) provides an extra layer of security for your AWS account.

## AWS Organizations ##

Suppose that your company has multiple AWS accounts. You can use AWS Organizations to consolidate and manage multiple AWS accounts within a central location.
When you create an organization, AWS Organizations automatically creates a root, which is the parent container for all the accounts in your organization. 
In AWS Organizations, you can centrally control permissions for the accounts in your organization by using service control policies (SCPs). SCPs enable you to place restrictions on the AWS services, resources, and individual API actions that users and roles in each account can access.

Consolidated billing is another feature of AWS Organizations. You will learn about consolidated billing in a later module.

## Organizational units ##

In AWS Organizations, you can group accounts into organizational units (OUs) to make it easier to manage accounts with similar business or security requirements. When you apply a policy to an OU, all the accounts in the OU automatically inherit the permissions specified in the policy.  
By organizing separate accounts into OUs, you can more easily isolate workloads or applications that have specific security requirements. For instance, if your company has accounts that can access only the AWS services that meet certain regulatory requirements, you can put these accounts into one OU. Then, you can attach a policy to the OU that blocks access to all other AWS services that do not meet the regulatory requirements.

## Denial-of-service attacks ##

A `denial-of-service (DoS) attack` is a deliberate attempt to make a website or application unavailable to users.

<img width="373" alt="DOS" src="https://github.com/viswa2/devops/assets/34201574/7252e9a4-1388-44fd-a235-474d8722e3cb">

For example, an attacker might flood a website or application with excessive network traffic until the targeted website or application becomes overloaded and is no longer able to respond. If the website or application becomes unavailable, this denies service to users who are trying to make legitimate requests.

## Distributed denial-of-service attacks ##

Now, suppose that the prankster has enlisted the help of friends. 
The prankster and their friends repeatedly call the coffee shop with requests to place orders, even though they do not intend to pick them up. These requests are coming in from different phone numbers, and it’s impossible for the coffee shop to block them all. Additionally, the influx of calls has made it increasingly difficult for customers to be able to get their calls through. This is like a distributed denial-of-service attack.

<img width="452" alt="DDOS" src="https://github.com/viswa2/devops/assets/34201574/449295ea-8334-4bd8-9992-7526651444cd">

In a distributed denial-of-service (DDoS) attack, multiple sources are used to start an attack that aims to make a website or application unavailable. This can come from a group of attackers, or even a single attacker. The single attacker can use multiple infected computers (also known as “bots”) to send excessive traffic to a website or application.
To help minimize the effect of DoS and DDoS attacks on your applications, you can use AWS Shield.

## AWS Shield ##

AWS Shield is a service that protects applications against DDoS attacks. AWS Shield provides two levels of protection: Standard and Advanced.
AWS Shield Standard automatically protects all AWS customers at no cost. It protects your AWS resources from the most common, frequently occurring types of DDoS attacks. 

As network traffic comes into your applications, AWS Shield Standard uses a variety of analysis techniques to detect malicious traffic in real time and automatically mitigates it. 

AWS Shield Advanced is a paid service that provides detailed attack diagnostics and the ability to detect and mitigate sophisticated DDoS attacks. 

It also integrates with other services such as Amazon CloudFront, Amazon Route 53, and Elastic Load Balancing. Additionally, you can integrate AWS Shield with AWS WAF by writing custom rules to mitigate complex DDoS attacks.

## AWS Key Management Service (AWS KMS) ##

The coffee shop has many items, such as coffee machines, pastries, money in the cash registers, and so on. You can think of these items as data. The coffee shop owners want to ensure that all of these items are secure, whether they’re sitting in the storage room or being transported between shop locations. 
In the same way, you must ensure that your applications’ data is secure while in storage (encryption at rest) and while it is transmitted, known as encryption in transit

`AWS Key Management Service (AWS KMS)` enables you to perform encryption operations using cryptographic keys. A cryptographic key is a random string of digits used for locking (encrypting) and unlocking (decrypting) data. You can use AWS KMS to create, manage, and use cryptographic keys. You can also control the use of keys across a wide range of services and in your applications.
With AWS KMS, you can choose the specific levels of access control that you need for your keys. For example, you can specify which IAM users and roles are able to manage keys. Alternatively, you can temporarily disable keys so that they are no longer in use by anyone. Your keys never leave AWS KMS, and you are always in control of them.

## AWS WAF ##

`AWS WAF` is a web application firewall that lets you monitor network requests that come into your web applications. 
AWS WAF works together with Amazon CloudFront and an Application Load Balancer. Recall the network access control lists that you learned about in an earlier module. AWS WAF works in a similar way to block or allow traffic. However, it does this by using a web access control list (ACL) to protect your AWS resources. 
Here’s an example of how you can use AWS WAF to allow and block specific requests.

Here’s an example of how you can use AWS WAF to allow and block specific requests.

<img width="448" alt="AWS-WAF" src="https://github.com/viswa2/devops/assets/34201574/920d0ab0-2a50-4988-82ba-3c9ebf0f49cb">

Suppose that your application has been receiving malicious network requests from several IP addresses. You want to prevent these requests from continuing to access your application, but you also want to ensure that legitimate users can still access it. You configure the web ACL to allow all requests except those from the IP addresses that you have specified.
When a request comes into AWS WAF, it checks against the list of rules that you have configured in the web ACL. If a request did not come from one of the blocked IP addresses, it allows access to the application.

<img width="370" alt="AWS-WAF-1" src="https://github.com/viswa2/devops/assets/34201574/5ef19ed3-beb1-4f0f-a13a-592d68d8d567">

However, if a request came from one of the blocked IP addresses that you have specified in the web ACL, it is denied access

## Amazon Inspector ##

Suppose that the developers at the coffee shop are developing and testing a new ordering application. They want to make sure that they are designing the application in accordance with security best practices. However, they have several other applications to develop, so they cannot spend much time conducting manual assessments. To perform automated security assessments, they decide to use Amazon Inspector.

Amazon Inspector helps to improve the security and compliance of applications by running automated security assessments. It checks applications for security vulnerabilities and deviations from security best practices, such as open access to Amazon EC2 instances and installations of vulnerable software versions. 
After Amazon Inspector has performed an assessment, it provides you with a list of security findings. The list prioritizes by severity level, including a detailed description of each security issue and a recommendation for how to fix it. However, AWS does not guarantee that following the provided recommendations resolves every potential security issue. Under the shared responsibility model, customers are responsible for the security of their applications, processes, and tools that run on AWS services.

## Amazon Guard Duty ##

Amazon Guard Duty is a service that provides intelligent threat detection for your AWS infrastructure and resources. It identifies threats by continuously monitoring the network activity and account behaviour within your AWS environment.

<img width="452" alt="Amazon-Guard" src="https://github.com/viswa2/devops/assets/34201574/5379a58b-a6b3-42cb-832e-2ca44a136b73">

After you have enabled GuardDuty for your AWS account, GuardDuty begins monitoring your network and account activity. You do not have to deploy or manage any additional security software. GuardDuty then continuously analyzes data from multiple AWS sources, including VPC Flow Logs and DNS logs. 
If GuardDuty detects any threats, you can review detailed findings about them from the AWS Management Console. Findings include recommended steps for remediation. You can also configure AWS Lambda functions to take remediation steps automatically in response to GuardDuty’s security findings.

## Amazon CloudWatch ##

Amazon CloudWatch is a web service that enables you to monitor and manage various metrics and configure alarm actions based on data from those metrics.
CloudWatch uses metrics to represent the data points for your resources. AWS services send metrics to CloudWatch. CloudWatch then uses these metrics to create graphs automatically that show how performance has changed over time. 

## CloudWatch alarms ##

With CloudWatch, you can create alarms that automatically perform actions if the value of your metric has gone above or below a predefined threshold. 
For example, suppose that your company’s developers use Amazon EC2 instances for application development or testing purposes. If the developers occasionally forget to stop the instances, the instances will continue to run and incur charges. 
In this scenario, you could create a CloudWatch alarm that automatically stops an Amazon EC2 instance when the CPU utilization percentage has remained below a certain threshold for a specified period. When configuring the alarm, you can specify to receive a notification whenever this alarm is triggered.

## CloudWatch dashboard ##

<img width="452" alt="Cloudwatch-Dashboard" src="https://github.com/viswa2/devops/assets/34201574/bb359427-2992-4b37-8e5a-506cdb0b19cf">

The `CloudWatch dashboard` feature enables you to access all the metrics for your resources from a single location. For example, you can use a CloudWatch dashboard to monitor the CPU utilization of an Amazon EC2 instance, the total number of requests made to an Amazon S3 bucket, and more. You can even customize separate dashboards for different business purposes, applications, or resources.

## AWS CloudTrail ##

`AWS CloudTrail` records API calls for your account. The recorded information includes the identity of the API caller, the time of the API call, the source IP address of the API caller, and more. You can think of CloudTrail as a “trail” of breadcrumbs (or a log of actions) that someone has left behind them.
Recall that you can use API calls to provision, manage, and configure your AWS resources. With CloudTrail, you can view a complete history of user activity and API calls for your applications and resources. 
Events are typically updated in CloudTrail within 15 minutes after an API call. You can filter events by specifying the time and date that an API call occurred, the user who requested the action, the type of resource that was involved in the API call, and more.

`Example: AWS CloudTrail event`

Suppose that the coffee shop owner is browsing through the AWS Identity and Access Management (IAM) section of the AWS Management Console. They discover that a new IAM user named Mary was created, but they do not who, when, or which method created the user.
To answer these questions, the owner navigates to AWS CloudTrail.

<img width="452" alt="Cloud-Trail" src="https://github.com/viswa2/devops/assets/34201574/84da9699-8f54-41c1-9eb4-99bff191b76d">

In the CloudTrail Event History section, the owner applies a filter to display only the events for the “Create User” API action in IAM. The owner locates the event for the API call that created an IAM user for Mary. This event record provides complete details about what occurred: 
On January 1, 2020, at 9:00 AM, IAM user John created a new IAM user (Mary) through the AWS Management Console.

## CloudTrail Insights ##

Within CloudTrail, you can also enable CloudTrail Insights. This optional feature allows CloudTrail to automatically detect unusual API activities in your AWS account. 
For example, CloudTrail Insights might detect that a higher number of Amazon EC2 instances than usual have recently launched in your account. You can then review the full event details to determine which actions you need to take next.

## AWS Trusted Advisor ##

AWS Trusted Advisor is a web service that inspects your AWS environment and provides real-time recommendations in accordance with AWS best practices.
Trusted Advisor compares its findings to AWS best practices in five categories: cost optimization, performance, security, fault tolerance, and service limits. For the checks in each category, Trusted Advisor offers a list of recommended actions and additional resources to learn more about AWS best practices.

The guidance provided by AWS Trusted Advisor can benefit your company at all stages of deployment. For example, you can use AWS Trusted Advisor to assist you while you are creating new workflows and developing new applications. Or you can use it while you are making ongoing improvements to existing applications and resources.

## AWS Trusted Advisor dashboard ##

![AWS-Trusted-Advisor](https://github.com/viswa2/devops/assets/34201574/1860f0e8-009c-4ef6-a047-61ddf634f3a5)

When you access the Trusted Advisor dashboard on the AWS Management Console, you can review completed checks for cost optimization, performance, security, fault tolerance, and service limits.
For each category:
•	The green check indicates the number of items for which it detected no problems.
•	The orange triangle represents the number of recommended investigations.
•	The red circle represents the number of recommended actions.

## AWS Free Tier ##
The AWS Free Tier enables you to begin using certain services without having to worry about incurring costs for the specified period. 
Three types of offers are available: 
•	Always Free
•	12 Months Free
•	Trials
For each free tier offer, make sure to review the specific details about exactly which resource types are included. 
To learn more, select the + symbol next to each category.

`Always Free`

These offers do not expire and are available to all AWS customers.
For example, AWS Lambda allows 1 million free requests and up to 3.2 million seconds of compute time per month. Amazon DynamoDB allows 25 GB of free stora

`12 Months Free`

These offers are free for 12 months following your initial sign-up date to AWS.
Examples include specific amounts of Amazon S3 Standard Storage, thresholds for monthly hours of Amazon EC2 compute time, and amounts of Amazon CloudFront data transfer out.

`Trials`

Short-term free trial offers start from the date you activate a particular service. The length of each trial might vary by number of days or the amount of usage in the service.

For example, Amazon Inspector offers a 90-day free trial. Amazon Lightsail (a service that enables you to run virtual private servers) offers 750 free hours of usage over a 30-day period.

Which action can you perform with consolidated billing?

`Ans:` Combine usage across accounts to receive volume pricing discounts.

Which pricing tool is used to visualize, understand, and manage your AWS costs and usage over time?

`Ans:`  AWS Cost Explorer

Which pricing tool enables you to receive alerts when your service usage exceeds a threshold that you have defined?

`Ans:` AWS Budgets

In AWS Budgets, you can set custom alerts that will notify you when your service usage exceeds (or is forecasted to exceed) the amount that you have budgeted.

Your company wants to receive support from an AWS Technical Account Manager (TAM). Which support plan should you choose?

`Ans:` Enterprise

A Technical Account Manager (TAM) is available only to AWS customers with the Enterprise On-Ramp and Enterprise Support plans. A TAM provides guidance, architectural reviews, and ongoing communication with your company as you plan, deploy, and optimize your applications.

Which service or resource is used to find third-party software that runs on AWS?

`Ans:` AWS Marketplace

AWS Marketplace is a digital catalog that includes thousands of software listings from independent software vendors. You can use AWS Marketplace to find, test, and buy software that runs on AWS.

## Migration and Innovation ##

`Six core perspectives of the Cloud Adoption Framework`

At the highest level, the AWS Cloud Adoption Framework (AWS CAF) organizes guidance into six areas of focus, called Perspectives. Each Perspective addresses distinct responsibilities. The planning process helps the right people across the organization prepare for the changes ahead.
In general, the Business, People, and Governance Perspectives focus on business capabilities, whereas the Platform, Security, and Operations Perspectives focus on technical capabilities.
The Business Perspective ensures that IT aligns with business needs and that IT investments link to key business results.

Use the Business Perspective to create a strong business case for cloud adoption and prioritize cloud adoption initiatives. Ensure that your business strategies and goals align with your IT strategies and goals.

`Common roles in the Business Perspective include:`

•	Business managers
•	Finance managers
•	Budget owners
•	Strategy stakeholders
The People Perspective supports development of an organization-wide change management strategy for successful cloud adoption.

Use the People Perspective to evaluate organizational structures and roles, new skill and process requirements, and identify gaps. This helps prioritize training, staffing, and organizational changes.

`Common roles in the People Perspective include:`

•	Human resources
•	Staffing
•	People managers
The Governance Perspective focuses on the skills and processes to align IT strategy with business strategy. This ensures that you maximize the business value and minimize risks.

Use the Governance Perspective to understand how to update the staff skills and processes necessary to ensure business governance in the cloud. Manage and measure cloud investments to evaluate business outcomes.

`Common roles in the Governance Perspective include:` 

•	Chief Information Officer (CIO)
•	Program managers
•	Enterprise architects
•	Business analysts
•	Portfolio managers
The Platform Perspective includes principles and patterns for implementing new solutions on the cloud and migrating on-premises workloads to the cloud.

Use a variety of architectural models to understand and communicate the structure of IT systems and their relationships. Describe the architecture of the target state environment in detail.

`Common roles in the Platform Perspective include:` 

•	Chief Technology Officer (CTO)
•	IT managers
•	Solutions architects
The Security Perspective ensures that the organization meets security objectives for visibility, auditability, control, and agility. 

Use the AWS CAF to structure the selection and implementation of security controls that meet the organization’s needs.

`Common roles in the Security Perspective include:` 

•	Chief Information Security Officer (CISO)
•	IT security managers
•	IT security analysts
The Operations Perspective helps you to enable, run, use, operate, and recover IT workloads to the level agreed upon with your business stakeholders.

Define how day-to-day, quarter-to-quarter, and year-to-year business is conducted. Align with and support the operations of the business. The AWS CAF helps these stakeholders define current operating procedures and identify the process changes and training needed to implement successful cloud adoption.

`Common roles in the Operations Perspective include:` 

•	IT operations managers
•	IT support managers
6 strategies for migration

`When migrating applications to the cloud, six of the most common migration strategies that you can implement are:`

•	Rehosting
•	Re platforming
•	Refactoring/re-architecting
•	Repurchasing
•	Retaining
•	Retiring
•	Rehosting

`Rehosting` also known as “lift-and-shift” involves moving applications without changes. 
In the scenario of a large legacy migration, in which the company is looking to implement its migration and scale quickly to meet a business case, most applications are rehosted. 

`Re-platforming`, also known as “lift, tinker, and shift,” involves making a few cloud optimizations to realize a tangible benefit. Optimization is achieved without changing the core architecture of the application.

`Refactoring` (also known as re-architecting) involves reimagining how an application is architected and developed by using cloud-native features. Refactoring is driven by a strong business need to add features, scale, or performance that would otherwise be difficult to achieve in the application’s existing environment.

`Repurchasing` involves moving from a traditional license to a software-as-a-service model. 
For example, a business might choose to implement the repurchasing strategy by migrating from a customer relationship management (CRM) system to Salesforce.com.

`Retaining` consists of keeping applications that are critical for the business in the source environment. This might include applications that require major refactoring before they can be migrated, or work that can be postponed until a later time.

`Retiring` is the process of removing applications that are no longer needed.

## AWS Snow Family members ##

The AWS Snow Family is a collection of physical devices that help to physically transport up to exabytes of data into and out of AWS. 
AWS Snow Family is composed of AWS Snowcone, AWS Snowball, and AWS Snowmobile.

![AWS-Snow-Ball](https://github.com/viswa2/devops/assets/34201574/557e51d5-3dbc-45ba-933e-16ab21e21e9c)

These devices offer different capacity points, and most include built-in computing capabilities. AWS owns and manages the Snow Family devices and integrates with AWS security, monitoring, storage management, and computing capabilities. 
AWS Snowcone is a small, rugged, and secure edge computing and data transfer device. 
It features 2 CPUs, 4 GB of memory, and 8 TB of usable storage.

`AWS Snowball offers two types of devices:`
•	Snowball Edge Storage Optimized devices are well suited for large-scale data migrations and recurring transfer workflows, in addition to local computing with higher capacity needs. 
o	Storage: 80 TB of hard disk drive (HDD) capacity for block volumes and Amazon S3 compatible object storage, and 1 TB of SATA solid state drive (SSD) for block volumes. 
o	Compute: 40 vCPUs, and 80 GiB of memory to support Amazon EC2 sbe1 instances (equivalent to C5).
•	Snowball Edge Compute Optimized provides powerful computing resources for use cases such as machine learning, full motion video analysis, analytics, and local computing stacks. 
o	Storage: 42-TB usable HDD capacity for Amazon S3 compatible object storage or Amazon EBS compatible block volumes and 7.68 TB of usable NVMe SSD capacity for Amazon EBS compatible block volumes. 
o	Compute: 52 vCPUs, 208 GiB of memory, and an optional NVIDIA Tesla V100 GPU. Devices run Amazon EC2 sbe-c and sbe-g instances, which are equivalent to C5, M5a, G3, and P3 instances.
AWS Snowmobile is an exabyte-scale data transfer service used to move large amounts of data to AWS. 
You can transfer up to 100 petabytes of data per Snowmobile, a 45-foot-long ruggedized shipping container, pulled by a semi-trailer truck.

## AWS Well-Architected Framework ##

The AWS Well-Architected Framework helps you understand how to design and operate reliable, secure, efficient, and cost-effective systems in the AWS Cloud. It provides a way for you to consistently measure your architecture against best practices and design principles and identify areas for improvement.

![AWS Well-Architected Framework](https://github.com/viswa2/devops/assets/34201574/b9dfda6d-9d5d-4b9a-a504-66efa28735af)

`The Well-Architected Framework is based on six pillars:`

•	Operational excellence
•	Security
•	Reliability
•	Performance efficiency
•	Cost optimization
•	Sustainability
Operational excellence is the ability to run and monitor systems to deliver business value and to continually improve supporting processes and procedures.  

Design principles for operational excellence in the cloud include performing operations as code, annotating documentation, anticipating failure, and frequently making small, reversible changes.

The Security pillar is the ability to protect information, systems, and assets while delivering business value through risk assessments and mitigation strategies. 

`When considering the security of your architecture, apply these best practices:`
•	Automate security best practices when possible.
•	Apply security at all layers.
•	Protect data in transit and at rest.
Reliability is the ability of a system to do the following:
•	Recover from infrastructure or service disruptions.
•	Dynamically acquire computing resources to meet demand.
•	Mitigate disruptions such as misconfigurations or transient network issues.
Reliability includes testing recovery procedures, scaling horizontally to increase aggregate system availability, and automatically recovering from failure.

Performance efficiency is the ability to use computing resources efficiently to meet system requirements and to maintain that efficiency as demand changes and technologies evolve. 

Evaluating the performance efficiency of your architecture includes experimenting more often, using serverless architectures, and designing systems to be able to go global in minutes.

Cost optimization is the ability to run systems to deliver business value at the lowest price point. 

Cost optimization includes adopting a consumption model, analyzing and attributing expenditure, and using managed services to reduce the cost of ownership.

In December 2021, AWS introduced a sustainability pillar as part of the AWS Well-Architected Framework.

Sustainability is the ability to continually improve sustainability impacts by reducing energy consumption and increasing efficiency across all components of a workload by maximizing the benefits from the provisioned resources and minimizing the total resources required.

To facilitate good design for sustainability:
•	Understand your impact.
•	Establish sustainability goals.
•	Maximize utilization.
•	Anticipate and adopt new, more efficient hardware and software offerings.
•	Use managed services.
•	Reduce the downstream impact of your cloud workloads.

`Reference Link:` https://aws.amazon.com/certification/certified-cloud-practitioner/



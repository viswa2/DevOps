## AWS Fundamentals ##
`What is Cloud Computing`

Cloud computing is the delivery of on-demand computing services over the internet on a pay-as-you-go basis. It offers the online data storage, Infrastructure and application.

<img width="359" alt="cloud-computing" src="https://github.com/viswa2/devops/assets/34201574/816eb632-2e32-44c6-b0f6-1020d7646aba">

Cloud computing offers platform independency, as the software is not required to be installed locally on the PC. Hence, the Cloud Computing is making our business applications mobile and collaborative.
Types of cloud computing model:
1.	Deployment Model
2.	Service Model
Types of Cloud Deployment Model:
1.	Public Cloud: The Cloud infrastructure is made available to general public over the internet and by cloud provider.
 Ex: - AWS, Azure, IBM’s Blue cloud and sun cloud
2.	Private Cloud: This Cloud Infrastructure Is Exclusively operated by a single organization. It can be managed by organization or third party and may exist on-premises or off-premises.
Ex: - AWS, VMware
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

EX: Public cloud providers such as AWS, Microsoft Azure, and Google Cloud are examples of IaaS.

`PAAS:`
Platform-as-a-service (PaaS) is another step further from full, on-premises infrastructure management. It is where a provider hosts the hardware and software on its own infrastructure and delivers this platform to the user as an integrated solution, solution stack, or service through an internet connection.

Primarily useful for developers and programmers, PaaS allows the user to develop, run, and manage their own apps without having to build and maintain the infrastructure or platform usually associated with the process. 
You write the code, build, and manage your apps, but you do it without the headaches of software updates or hardware maintenance. The environment to build and deploy is provided for you. 
PaaS is a way that developers can create a framework to build and customize their web-based applications on. Developers can use built-in software components to create their applications, which cuts down on the amount of code they must write themselves.
EX: A few examples of PaaS are AWS Elastic Beanstalk, Heroku, and Red Hat OpenShift.

`SAAS:`
Software-as-a-service (SaaS), also known as cloud application services, is the most comprehensive form of cloud computing services, delivering an entire application that is managed by a provider, via a web browser. 
Software updates, bug fixes, and general software maintenance are handled by the provider and the user connects to the app via a dashboard or API. There’s no installation of the software on individual machines and group access to the program is smoother and more reliable. 
You’re already familiar with a form of SaaS if you have an email account with a web-based service like Outlook or Gmail, for example, as you can log into your account and get your email from any computer, anywhere. 
SaaS is a great option for small businesses who don’t have the staff or bandwidth to handle software installation and updates, as well as for applications that don’t require much customization or that will only be used periodically. 
What SaaS saves you in time and maintenance, however, it could cost you in control, security, and performance, so it’s important to choose a provider you can trust.
EX: Dropbox, Salesforce, Google Apps, and Red Hat Insights are some examples of SaaS. 
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

A Region consists of two or more Availability Zones.

For example: the South America (São Paulo) Region is sa-east-1. It includes three Availability Zones: sa-east-1a, sa-east-1b, and sa-east-1c.

Reference Link: Global Infrastructure Regions & AZs (amazon.com)

`EC2 (Elastic cloud Computing):`

Amazon EC2 instance you can use a virtual server to run applications in the AWS Cloud.
•	you can provision and launch an Amazon EC2 instance within minutes.
•	You can stop using it when you have finished running a workload.
•	You pay only for the compute time you use when an instance is running, not when it is stopped or terminated.
•	You can save costs by paying only for server capacity that you need or want.

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
are designed for workloads that require high, sequential read and write access to large datasets on local storage. Examples of workloads suitable for storage optimized instances include distributed file systems, data warehousing applications, and high-frequency online transaction processing (OLTP) systems.

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

Example: Orders in a queue
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
    1.	Provision instances (virtual servers).
    2. Upload your code. 
 	  3. Continue to manage the instances while your application is running.
    
•	The term “serverless” means that your code runs on servers, but you do not need to provision or manage these servers. With serverless computing, you can     
  focus more on innovating new products and features instead of maintaining servers.
•	Another benefit of serverless computing is the flexibility to scale serverless applications automatically. Serverless computing can adjust the applications' 
  capacity by modifying the units of consumptions, such as throughput and memory. 
•	An AWS service for serverless computing is AWS Lambda.

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

## Internet gateway ##

To allow public traffic from the internet to access your VPC, you attach an internet gateway to the VPC.





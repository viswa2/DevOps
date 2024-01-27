## AWS Cloud Practitioner Technical Essentials ##

1. Create IAM role --> Role --> Create role --> AWS service --> s3 --> AmazonDynamoDBFullAccess --> next --> Rolename
2. Create s3 bucket for objects --> create bucket --> AWS region ex: us-east-1 --> bucket name Ex: employee-photo-bucket-00 --> Add the bucket policy --> Create bucket
3. Launch Ec2 Instance --> Instance name --> AMI from catalog --> Instance type t2.micro --> Key pair you can select or create a new key pair to connect the instance --> VPC earlier I have create app-vpc select the same --> Subnet created earlier select the same --> Create security group for Http and Https --> Advandced details --> IAM Instance profile --> select the  AmazonDynamoDBFullAccess --> Under the user data add the script for the Employee directory app --> Create Instance --> Wait a minute and check the app is working or not with the public ip in the browser.

4. IAM Instance Profile added in Advance details as created role in the first step.

<img width="477" alt="IAM Instance Profile" src="https://github.com/viswa2/DevOps/assets/34201574/ec0b8553-c24a-4e45-a2b9-bed541608b7c">

<img width="1717" alt="Employee-Directory-App" src="https://github.com/viswa2/devops/assets/34201574/461a75a0-75dd-4f98-ac8a-583554bcdede">

4. Create the dynamo db --> Create table --> Table name --> Employees --> Partition key is id for string --> Remaining default options and create table.
5. As per the above screenshot fill the details i.e Name, Location, JobTitle and upload your photo once done save the details.
6. Go to the bucket and click on there should be employee_pic uploaded
7. Go the dynamodb and click on Tables --> Click on Table name Ex: Employees --> Explore Table Items --> There should be your details in the table i.e Name, Location and Jobtitle.

<img width="1039" alt="Dynamo-DB-Table" src="https://github.com/viswa2/devops/assets/34201574/ed6f39e1-746e-476f-8171-fe3e0bd721cc">

## Amazon Machine Image or AMI ##

1. Launch an EC2 instance with the user data of httpd

<img width="336" alt="User-Data for EC2" src="https://github.com/viswa2/DevOps/assets/34201574/81115aef-80a4-48dc-9292-bd323b1e0538">

2. check with the public ip in the browser

<img width="465" alt="HTTPD-Configuration-Check-in Browser" src="https://github.com/viswa2/DevOps/assets/34201574/0e7765cb-ba91-4b21-ad8e-477ef735bdb2">

3. Create a image from the EC2 instance which we created on it's first step --> Select the EC2 instance from the 1st Step --> Click on Actions --> Image and Templates --> Image name --> Create image i.e Then click on EC2 dashboard --> Images --> AMIs --> You can find the created image.

<img width="1439" alt="AMI" src="https://github.com/viswa2/DevOps/assets/34201574/4861798a-5bf2-4064-af5f-03c09a9c7bc3">

5. Launch a instance from AMI list which was created on 3rd step with the user data with the just last line of echo statement.

<img width="743" alt="AMI from Catalog" src="https://github.com/viswa2/DevOps/assets/34201574/7667160b-3c85-4c48-b598-ace82702a5cd">

<img width="559" alt="User-Data" src="https://github.com/viswa2/DevOps/assets/34201574/02eed45c-9dca-4604-88a9-5fd228ccfcd5">

6. Check instance public ip in the browser it's should work.

7. Find the screenshot for the second instance as below.

<img width="955" alt="AMI Image Instance IP" src="https://github.com/viswa2/DevOps/assets/34201574/d90ceb66-369c-4cf3-8fb9-ed108a2df11f">

## Application Load Balancer ##

1. Launch 2 EC2 instances with the same style --> My first instance --> Number of instances 2 --> Instance type t2.micro --> Proceed without keypair --> Under network settings select existing security group which is having ssh and http indbound rule if not create a new one --> Advance details --> user data --> add user-data-for-load-balancer

2. After launching the 2 instances change the name for one of the instance from My First Instance to My Second Instance

<img width="1488" alt="2-EC@-Instances created for -Load-Balancer" src="https://github.com/viswa2/DevOps/assets/34201574/f487987a-a91f-4e38-b139-653ef03a36c8">

3. Check the public Ip of both Ec2 instances if it's working or not as per below attaching here one instance reference.

<img width="758" alt="Ec2-Instance-Public-Ip" src="https://github.com/viswa2/DevOps/assets/34201574/abaa77af-0daa-4a09-9799-0eb809c84dbe">

4. Click on load balancers --> create load balancer --> click on creat application load balancer --> load abalancer name i.e Demo-ALB, Internet-facing, ip address type ipv4 --> Network mapping --> Select at least two Availability Zones --> Refresh and select the Security group which we created in 5th step --> Refresh and select the target group which we created in 6th step --> Create a load balancer

<img width="1485" alt="Application-Load-Balancer" src="https://github.com/viswa2/DevOps/assets/34201574/d1d6b659-ccca-464a-a746-76037da60044">

5. Create a new security group which is allowing http port

<img width="1420" alt="Security-group for- load- balancer" src="https://github.com/viswa2/DevOps/assets/34201574/e4db92d2-301d-4698-93ad-6593b9f269e2">
  
6. Listner and routing --> choose a target type --> Instances --> Target Group Name --> Protocol port http --> IP address type ipv4--> Health checks HTTP --> Register Targets select the 2 instances --> Include as pending below --> Create Target Group

<img width="1446" alt="Target-Groups" src="https://github.com/viswa2/DevOps/assets/34201574/17335d87-5d6a-4dd3-9f39-1d84973343ce">

7. Copy DNS name of the load balancer and open in the browser and refresh it you camn able to observe the two ip address of the 2 EC2 instances.

<img width="704" alt="First-EC2-Instance-Ip" src="https://github.com/viswa2/DevOps/assets/34201574/4b0dd520-aa96-45c8-9f8f-c349d3d48ca4">

<img width="701" alt="Second-Ec2-IP-Address" src="https://github.com/viswa2/DevOps/assets/34201574/13bd5b62-f641-43d0-98d9-89af6dbfe16a">

8. For futrher testing you can stop one instance and refresh the DNS name of load balancer and vice versa


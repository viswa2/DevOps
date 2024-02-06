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

## S3 Bucket ##

1. Search on s3 on amaznon dashboard and click on create bucket
2. Select the region if you want to create a bucket
3. Bucket name must be unique within the global namespace and follow the bucket naming rules
4. Object Ownership  ACL's disabled
5. Block all public access
6. Disable bucket versioning
7. Rest of the options are default and create a bucket
8. Click on the bucket name --> upload --> Add files --> Slect from your computer --> Upload
9. Click on the objects which you have uploaded and click on object url you will get AccessDenied error due to Block all public access on 6th point.
10. Now click on bucket permissions and edit Block public access (bucket settings) uncheck Block all public access and save
11. Edit the Bucket policy click on plocy generator (https://awspolicygen.s3.amazonaws.com/policygen.html) and fill the necessary details add statement and generate policy.

<img width="1521" alt="S3-bucket-p;olicy-Generator" src="https://github.com/viswa2/DevOps/assets/34201574/78d17a6c-4a76-4b24-a23d-254af0c0b9a0">

12. Copy the policy and paste policy and click on save changes
13. Now try to refresh the object URl

<img width="1156" alt="S3-bucket-object-url-testing" src="https://github.com/viswa2/DevOps/assets/34201574/2f915698-ddfa-401b-af56-4fda2756cbf9">

## Static website hosting ##

1. Click buckets --> Bucket name --> properties --> edit and enable static website hosting --> Save changes
2. Upload the indx.html file into the bucket
3. Go to the Static website hosting click on url find the below image as reference.

<img width="591" alt="static-website-hosting" src="https://github.com/viswa2/DevOps/assets/34201574/129d1275-f623-4365-9a0c-ffc7951bc278">

4. if you want to enable the bucket versioning click on properties Bucket Versioning enable and save it.
5. Then try to upload some modificatiopn with the index.html and upload the same.

<img width="1606" alt="s3-bucket-versioning" src="https://github.com/viswa2/DevOps/assets/34201574/1dda5c3e-63de-4caa-87d0-52b24e603a2d">

## Replication Rules for S3 Bucket ##

1. Create a 2 buckets for replication testing i.e replication-origin and replication-destination0

<img width="1569" alt="s3-buckets-for replication-testing" src="https://github.com/viswa2/DevOps/assets/34201574/2e096291-654e-46e5-8a7f-21e636b2c9fa">

2. Create a replication rule in `replication-origin` bucket click on Management --> Replication rule name i.e mydemo replication --> Status enabled --> Under source bucket Apply to all objects in the bucket --> Destination choose --> Choose a bucket in this account, add the bucket name i.e `replication-destination0` --> IAM role --> Create a new role --> keep remaining as default and save.

3. Upload the objects for testing with the versioning enabled
4. Go to the `replication-destination0` bucket and refresh the page you can observe same file with the same version id.

<img width="1601" alt="replication-source" src="https://github.com/viswa2/DevOps/assets/34201574/5ca7fc5b-ea69-4171-b8f2-1318b3d5a746">

5. Replication destination with `replication-destination0`

<img width="1608" alt="replication-destination" src="https://github.com/viswa2/DevOps/assets/34201574/4454fdfd-a696-4319-9f6e-546df97108b1">

## S3 Storage Class ##

<img width="636" alt="s3-storage-classes" src="https://github.com/viswa2/DevOps/assets/34201574/7b18791c-0fcb-4ade-aff1-654f83d87e9d">

`Reference Link:` https://aws.amazon.com/s3/storage-classes/

## S3 Encryption ##

<img width="964" alt="S3 Encryption" src="https://github.com/viswa2/DevOps/assets/34201574/009b7a48-0bb9-48d0-a6b1-0bc8c622b9a1">

## Cloud Formation ##

CloudFormation, It's infrastructure as code. This means that you can build an environment by writing lines of code instead of using the AWS Management Console to individually provision your infrastructure resources.

1. Select the region as us-east-1 otherwise things will not work.
2. Create a stack & Prerequisite –-> Prepare template--> select Template is ready
3. Specify Template --> select Upload a template file i.e upload from your computer or you can select Amazon S3 url as well.

<img width="1291" alt="Upload a template from computer" src="https://github.com/viswa2/DevOps/assets/34201574/0afd6382-fbd2-4a6f-bafe-478c11b03359">

4. Provide a stack name called i.e Demo Cloudformation and click on next
5. Configure stack options provide key and value fields and click on next and submit
6. Then You can observe Events

<img width="1064" alt="Cloud-formation-Events" src="https://github.com/viswa2/DevOps/assets/34201574/bbe6a256-1f1b-4821-841d-42ba31a39156">

7. Open the next tab and you can able to see the Ec2 intsance through the cloudformation which we have provisioned.

<img width="1485" alt="Cloud-Formation-Through-Ec2-Instance" src="https://github.com/viswa2/DevOps/assets/34201574/a835737f-1ef5-4140-a0bd-d624ad3419d3">

8. If you want to update stack click on update stack --> replace current template --> Upload a template file with the changes. Once done it will terminate the existing resources and re-create with the new one.
   
9. If we want to delete the resources there is no need to go each and indivual resources to delete simply go and delete the stack 

## Cloud Front ##

`Note:` Amazon CloudFront is a content delivery network (CDN) service built for high performance, security, and developer convenience. Caches and serves static & dynamic content it's a global service.

**Protection against network and application layer attacks**
Amazon CloudFront, AWS Shield, AWS Web Application Firewall (WAF), and Amazon Route 53 work seamlessly together to create a flexible, layered security perimeter against multiple types of attacks including network and application layer DDoS attacks.

1. Create a bucket in S3
2. Upload with the files for cloudfront testing.

<img width="1371" alt="S3-bucket for Cloudfront" src="https://github.com/viswa2/DevOps/assets/34201574/e46ec12b-8c6a-47c3-a6b7-17e307adaf48">

3. Now open the Object url it won't work due to AccessDenied error because we blocked the public access. This we can able to acheive by using cloudfront.

<img width="775" alt="Cloudfront demo object url" src="https://github.com/viswa2/DevOps/assets/34201574/bd672d96-9a45-47ac-bebb-8ce6ccc1823f">

4. Next in Amaznon search i.e cloudfront & Create distribution ie choose the name of bucket object url which we was created the bucket in 1st step
5. Name of this origin i.e demo-cloudfront10.s3.us-east-1.amazonaws.com (it's same like the distrubution)
6. Origin access public 
7. Under Web Application Firewall (WAF) select Do not enable security protections
8. under Default root object type index.html which we were uploaded earlier in s3 bucket and then click create distribution.
9. Once the distribution status is enabled click on Distribution domain name and see the magic.

<img width="358" alt="Cloudfront Image" src="https://github.com/viswa2/DevOps/assets/34201574/897a9dcd-6062-47ab-8d2d-557d76df830a">

10. You can try with the domain name with the index.html and image.jpg etc.


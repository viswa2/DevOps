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

3. Create a image from the EC2 instance which we created on it's first step --> Select the EC2 instance from the 1st Step --> Click on Actions --> Image and Templates --> Image name --> Create image
4. Launch a instance from AMI list with the user data just last line of echo statement
5. Check both instances public ip in the browser it's should work.

provider "aws" {
    region = "us-east-1"
}

resource aws_instance "my-ec2" {
    ami = "ami-06c68f701d8090592"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-0e462b7672ca73f0b", "sg-0799bc2e35b486b72"]
}
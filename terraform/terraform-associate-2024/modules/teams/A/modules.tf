module "ec2" {
    source = "../../../modules/ec2-module"
}

resource "aws_eip" "lb" {
    instance = module.ec2.instance_id
    domain = "vpc"
}
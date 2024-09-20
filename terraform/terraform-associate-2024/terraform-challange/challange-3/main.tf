##############################################################################
# Challange-3                                                                #
# We have as below variable code, by using needs to create a EC2 instance    #
# for each meta argument and needs to use both ami's and instance types to   #
# complete the challange.                                                    #
##############################################################################

variable "instance_config" {
  type = map(any)
  default = {
    instance1 = { instance_type = "t2.micro", ami = "ami-037774efca2da0726" }
    instance3 = { instance_type = "t2.large", ami = "ami-085f9c64a9b75eed5" }
  }
}

resource "aws_instance" "challange-3" {
  for_each      = var.instance_config
  instance_type = each.value.instance_type
  ami           = each.value.ami
}

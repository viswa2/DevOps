resource "aws_instance" "remote_provisioner" {
  ami                    = "ami-00db8dadb36c9815e"
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  vpc_security_group_ids = ["sg-03bf2e19f87326f57"]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./terraform-key.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",
      "sudo yum -y install nginx",
      "sudo systemctl start nginx"
    ]
  }
}

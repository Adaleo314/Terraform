variable "region" {
  type    = string
  default = ""
}

variable "ami" {
  type = map(string)
  default = {
    "us-east-1" = "ami-xxxxxxxxxxx"
    "us-east-2" = "ami-xxxxxxxxxxx"
  }
}

variable "instance_size" {
  type = string
  default = {
    "micro"  = "t2.micro"
    "small"  = "t2.small"
    "medium" = "t2.medium"
    "large"  = "t2.large"
  }
}

resource "aws_instance" "tfweb" {
  ami           = var.ami[var.region]
  instance_type = var.instance_type[var.instance_size]
  user_data     = file("startup.sh")
  /* <<EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install apache2 -y
    sudo service apache2 start
    sudo chkconfig apache2 on
    EOF */
  tags = {
    Name = var.tags
  }
}


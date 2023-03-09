#EC2 Variables
variable "ami" {
  description = "ami of ec2 instance"
  type        = string
  default     = "ami-09cd747c78a9add63"
}

variable "instance_type" {
  description = "Size of EC2 Instances"
  type        = string
  default     = "t2.micro"
}

variable "user_data" {
  description = "boostrap script for nginx"
  type        = string
  default     = <<EOF
  #!/bin/bash
    

  sudo apt update -y
  sudo apt upgrade -y
  sudo apt install -y nginx

  sudo ufw allow 'Nginx HTTP'
  
  # Start Apache Service
  sudo systemctl start nginx  
  sudo systemctl enable nginx

  EOF
}

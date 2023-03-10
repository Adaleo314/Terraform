data "aws_availability_zones" "available" {}


#VPC Variables

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public Subnet cidr block"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr" {
  description = "Private Subnet cidr block"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "AZ" {
  description = "Availability Zones of Resources"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}



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
# Install Nginx
sudo apt update -y
sudo apt install -y nginx
sudo apt install -y mysql-client
sudo systemctl start nginx
sudo systemctl enable nginx
sudo ufw allow 'Nginx HTTP'
EOF
}


# db engine
variable "db_engine" {
  description = "Database Engine"
  type        = string
  default     = "mysql"
}


# db engine version
variable "db_engine_version" {
  description = "Database Version"
  type        = string
  default     = "8.0.32"
}


# db name
variable "db_name" {
  description = "Name of Database"
  type        = string
}

variable "db_storage" {
  description = "Allocated DB Storage"
  type        = string
  default     = "10"
}

# db instance class
variable "db_instance_class" {
  description = "Database instance size"
  type        = string
  default     = "db.t2.small"
}


# database username variable
variable "db_username" {
  description = "database admin username"
  type        = string
  sensitive   = true
  default     = "user"
}


# database password variable
variable "db_password" {
  description = "database admin password"
  type        = string
  sensitive   = true
  default     = "password"
}

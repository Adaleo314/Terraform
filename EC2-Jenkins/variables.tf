
#VPC/Security Group Variables
variable "vpc" {
  description = "ID of VPC Used"
  type        = string
  default     = "vpc-0c5c8875f856c2cac"
}

variable "jenkins_security_name" {
  description = "Security Group for EC2/Jenkins"
  type        = string
  default     = "jenkins-sg"
}

#EC2 Variables
variable "ami" {
  description = "Amazon Linux 2 AMI"
  type        = string
  default     = "ami-0dfcb1ef8550277af"
}

variable "instance_type" {
  description = "Instance Type of EC2"
  type        = string
  default     = "t2.micro"
}

variable "user_data" {
  description = "Jenkins Bootstrap for EC2"
  type        = string
  default     = <<EOF
    #!/bin/bash
    # Install Jenkins and Java 
    sudo wget -O /etc/yum.repos.d/jenkins.repo \
      https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
    sudo yum upgrade
    # Add required dependencies for the jenkins package
    sudo amazon-linux-extras install -y java-openjdk11 
    sudo yum install -y jenkins
    sudo systemctl daemon-reload

  # Start Jenkins
    sudo systemctl enable jenkins
    sudo systemctl start jenkins
    EOF
}


#S3 Bucket Variables

variable "s3_bucket_name" {
  description = "Bucket for Jenkins Artifacts"
  type        = string
  default     = "adaleojenkinsartifacts314"
}
  
#Terraform Deployment for Security Group, EC2 instance, Jenkins Install w/ Boostrap

resource "aws_security_group" "jenkins-sg" {
  name   = "Jenkins Security Group"
  vpc_id = var.vpc


  #Allow traffic on port 8080
  ingress {
    description = "HTTP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #Allow SSH from my IP
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Allow all outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins_app" {
  ami                    = var.ami #Amazon Linux 2
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
  user_data              = var.user_data
  tags = {
    Name = "Jenkins Prod"
  }
}

resource "aws_s3_bucket" "jenkins_artifacts_s3" {
  bucket = var.s3_bucket_name

  tags = {
    Name = var.s3_bucket_name
  }
}


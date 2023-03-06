module "ec2" {
  source = "./" #path to file or repo

  region = var.region
  ami_id = var.ami
  instance_size = var.instance_size
  instance_type = var.instance_type
  

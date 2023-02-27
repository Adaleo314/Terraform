terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.10.0"
    }
  }
  required_version = ">= 1.3.9"
  backend "s3" {
    region  = "us-east-1"
    key     = "terraform.tfstate"
    bucket  = "luitbuckettime"
  }
}

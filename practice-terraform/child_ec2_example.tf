variable "region" {
    type = string
    default ""
}

variable "ami" {
    type = map(string)
    default = {
      "us-east-1" = "ami-xxxxxxxxxxx"
      "us-east-2" = "ami-xxxxxxxxxxx"
    }
}

variable "instance_size" {
    type = "string"
    default = {
        "micro" = "t2.micro"
        "small" = "t2.small"
        "medium" = "t2.medium"
        "large" = "t2.large"
    }
}
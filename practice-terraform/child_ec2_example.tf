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


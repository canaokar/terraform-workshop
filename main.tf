terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-south-1"
}

resource "aws_instance" "app_server_[YOUR_NAME]" {
  ami           = "ami-0f58b397bc5c1f2e8"
  #ami           = "ami-02e1a4ebef29334f9"
  instance_type = "t2.micro"

  tags = {
    Name = "my-terraform-demo-[YOUR_NAME]"
    #Name = var.instance_name
  }
}

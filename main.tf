terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.100.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  # Credentials are picked up from AWS CLI or environment variables
  # Do NOT include access_key or secret_key here
}

resource "aws_instance" "ec2_instance" {
  ami               = "ami-0ff5003538b60d5ec"  
  instance_type     = "t3.medium"
  availability_zone = "ap-south-1a"
  key_name          = "Linux_EC2instance"           

  tags = {
    Name = "Terraform-EC2"
  }
}

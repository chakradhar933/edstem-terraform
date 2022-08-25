provider "aws" {
   region     = "eu-central-1"
   access_key = var.access_key
   secret_key = var.secret_key
}

resource "aws_instance" "ec2_example" {
    ami = "ami-0767046d1677be5a0"
    instance_type = "t2.micro"
    tags = {
      Name = "EC2 Instance with remote state"
    }
}

terraform {
    backend "s3" {
        bucket = "edstem934-terraform-s3-bucket"
        key    = "edstem934/terraform/remote/s3/terraform.tfstate"
        region     = "us-east-2"
        dynamodb_table = "dynamodb-state-locking"
    }
}
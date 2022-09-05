provider "aws" {
   region     = "us-east-2"
   access_key = "*********"
   secret_key = "************"
}

terraform {
    backend "s3" {
        bucket = "edstem943-terraform-s3-bucket"
        key    = "edstem943/terraform/remote/s3/terraform.tfstate"
        region     = "us-east-2"
        #access_key = "#################"
        #secret_key = "##################"
    }
}


resource "aws_instance" "ec2_example" {

    ami = "ami-051dfed8f67f095f5" 

    instance_type = "t2.micro"

    tags = {
      Name = "EC2 Instance with remote state"
    }
}

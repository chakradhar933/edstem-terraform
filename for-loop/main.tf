provider "aws" {
   region     = "us-east-2"
   access_key = "************"
   secret_key = "**************"
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-051dfed8f67f095f5"
   instance_type =  "t2.micro"
   count = 1

   tags = {
           Name = "edstem EC2"
   }

}

locals {
   ingress_rules = [{
      port        = 443
      description = "Ingress rules for port 443"
   },
   {
      port        = 80
      description = "Ingree rules for port 80"
   }]
}

resource "aws_security_group" "edstem" {
   name   = "resource_with_dynamic_block"
   vpc_id = data.aws_vpc.edstem.id

   dynamic "ingress" {
      for_each = local.ingress_rules

      content {
         description = ingress.value.description
         from_port   = ingress.value.port
         to_port     = ingress.value.port
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
      }
   }

   tags = {
      Name = "AWS security group dynamic block"
   }
}

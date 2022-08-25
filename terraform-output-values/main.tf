provider "aws" {
   region     = "us-east-2"
   access_key = "################"
   secret_key = "#################"
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-0568773882d492fc8"
   instance_type =  "t2.micro"

   tags = {
           Name = "edstem EC2"
   }
}

output "my_console_output" {
   value = "Hello this is edstem"
   sensitive = true
} 
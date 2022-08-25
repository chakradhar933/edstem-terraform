provider "aws" {
   region     = "us-east-2"
   access_key = "#################"
   secret_key = "#####################"
}


resource "aws_s3_bucket" "spacelift-test2-s3" {
    bucket = "spacelift-test2-s3" 
    acl = "private"   
}





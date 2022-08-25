provider "aws" {
   region     = "us-east-2"
   access_key = "#################"
   secret_key = "#####################"
}

resource "aws_s3_bucket" "edstem934-test1-s3" {
    bucket = "edstem934-test1-s3" 
    acl = "private"   
}

resource "aws_s3_bucket_object" "object1" {
    for_each = fileset("uploads/", "*")
    bucket = aws_s3_bucket.edstem934-test1-s3.id
    key = each.value
    source = "uploads/${each.value}"
    etag = filemd5("uploads/${each.value}")
}


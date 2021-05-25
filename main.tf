provider "aws" {
  region = "us-east-2"
}
resource "aws_s3_bucket" "b1" {

  bucket = "s3-terraform-bucket-lab-demo"

  acl    = "public-read"

  policy = file("policy.json")

  website {

    index_document = "index.html"

    error_document = "error.html"
  }


  tags = {

    Name        = "My bucket"

    Environment = "Dev"

  }

}

resource "aws_s3_bucket_object" "object1" {

  bucket = aws_s3_bucket.b1.id

  acl    = "public-read"

  source = "index.html"

  etag = file("index.html")

}

resource "aws_s3_bucket_object" "object2" {

  bucket = aws_s3_bucket.b1.id

  acl    = "public-read"

  source = "error.html"

  etag = file("error.html")

}

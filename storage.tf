resource "aws_s3_bucket" "twink_lab02" {

  bucket = replace("twink_lab02", "_", "-")
  acl    = "private"

  force_destroy = true

}

resource "aws_s3_bucket_object" "tarball_base" {

  bucket                 = aws_s3_bucket.twink_lab02.id
  content_type           = "binary/octet-stream"
  server_side_encryption = "AES256"
  key                    = "cloudconfig/base.tar.gz"
  source                 = "cloudconfig/base.tar.gz"
  etag                   = filemd5("cloudconfig/base.tar.gz")

}

resource "aws_s3_bucket_object" "bootstrap_base" {

  bucket                 = aws_s3_bucket.twink_lab02.id
  content_type           = "text/plain"
  server_side_encryption = "AES256"
  key                    = "cloudconfig/base.yml"
  source                 = "cloudconfig/base.yml"
  etag                   = filemd5("cloudconfig/base.yml")

}

resource "aws_s3_bucket_object" "bootstrap_web" {

  bucket                 = aws_s3_bucket.twink_lab02.id
  content_type           = "text/plain"
  server_side_encryption = "AES256"
  key                    = "cloudconfig/web.yml"
  source                 = "cloudconfig/web.yml"
  etag                   = filemd5("cloudconfig/web.yml")

}

resource "aws_s3_bucket_object" "bootstrap_db" {

  bucket                 = aws_s3_bucket.twink_lab02.id
  content_type           = "text/plain"
  server_side_encryption = "AES256"
  key                    = "cloudconfig/db.yml"
  source                 = "cloudconfig/db.yml"
  etag                   = filemd5("cloudconfig/db.yml")

}


resource "aws_s3_bucket" "twink_lab02" {

  bucket        = replace("twink_lab02", "_", "-")
  acl           = "private"

  force_destroy = true

}

resource "aws_s3_bucket_object" "base_tarball" {

  bucket                 = aws_s3_bucket.twink_lab02.id
  server_side_encryption = "AES256"
  key                    = "cloudconfig/base.tar.gz"
  source                 = "cloudconfig/base.tar.gz"
  etag                   = filemd5("cloudconfig/base.tar.gz")

}

resource "aws_s3_bucket_object" "base_bootstrap" {

  bucket                 = aws_s3_bucket.twink_lab02.id
  server_side_encryption = "AES256"
  key                    = "cloudconfig/base.yml"
  source                 = "cloudconfig/base.yml"
  etag                   = filemd5("cloudconfig/base.yml")

}


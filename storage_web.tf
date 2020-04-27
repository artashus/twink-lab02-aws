resource "aws_s3_bucket_object" "bootstrap_web" {

  bucket                 = aws_s3_bucket.twink_lab02.id
  content_type           = "text/plain"
  server_side_encryption = "AES256"
  key                    = "cloudconfig/web.yml"
  source                 = "cloudconfig/web.yml"
  etag                   = filemd5("cloudconfig/web.yml")

}

data "aws_s3_bucket_object" "bootstrap_web" {

  bucket = aws_s3_bucket.twink_lab02.id
  key    = aws_s3_bucket_object.bootstrap_web.key

}


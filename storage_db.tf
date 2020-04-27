resource "aws_s3_bucket_object" "bootstrap_db" {

  bucket                 = aws_s3_bucket.twink_lab02.id
  content_type           = "text/plain"
  server_side_encryption = "AES256"
  key                    = "cloudconfig/db.yml"
  source                 = "cloudconfig/db.yml"
  etag                   = filemd5("cloudconfig/db.yml")

}

data "aws_s3_bucket_object" "bootstrap_db" {

  bucket = aws_s3_bucket.twink_lab02.id
  key    = aws_s3_bucket_object.bootstrap_db.key

}


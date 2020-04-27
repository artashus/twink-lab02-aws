resource "aws_s3_bucket" "twink_lab01" {

  bucket = replace("twink_lab01", "_", "-")
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    enabled = true
    noncurrent_version_transition {
      days          = 30
      storage_class = "ONEZONE_IA"
    }
    noncurrent_version_expiration {
      days = 60
    }
  }

}

resource "aws_s3_bucket_object" "content_file" {

  bucket                 = aws_s3_bucket.twink_lab01.id
  acl                    = "private"
  storage_class          = "STANDARD_IA"
  server_side_encryption = "AES256"
  key                    = "content/index.html"
  source                 = "content/index.html"
  # etag                   = filemd5("content/index.html")

}

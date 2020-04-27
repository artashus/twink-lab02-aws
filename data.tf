data "aws_s3_bucket_object" "bootstrap_base" {

  bucket = aws_s3_bucket.twink_lab02.id
  key    = aws_s3_bucket_object.bootstrap_base.key

}

data "aws_s3_bucket_object" "bootstrap_web" {

  bucket = aws_s3_bucket.twink_lab02.id
  key    = aws_s3_bucket_object.bootstrap_web.key

}

data "aws_s3_bucket_object" "bootstrap_db" {

  bucket = aws_s3_bucket.twink_lab02.id
  key    = aws_s3_bucket_object.bootstrap_db.key

}

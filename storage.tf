resource "aws_s3_bucket" "twink_common" {

  bucket = replace("twink_common", "_", "-")
  acl    = "private"

  force_destroy  = true

}

resource "null_resource" "sync_to_s3" {

  provisioner "local-exec" {
    command = "aws s3 sync ./cloudconfig s3://${aws_s3_bucket.twink_common.id}/cloudconfig"
  }

}

output "run_this_now_to_keep_it_synced" {

  value = "terraform taint null_resource.sync_to_s3"

}

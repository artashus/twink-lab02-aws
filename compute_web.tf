resource "aws_instance" "lab02_web01" {

  tags = {
    Name = "lab02_web01"
  }

  ami                    = "ami-0323c3dd2da7fb37d"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.lab02_web.id]
  key_name               = "id_rsa_arabadj.pub"
  user_data              = data.aws_s3_bucket_object.bootstrap_web.body

  iam_instance_profile   = aws_iam_instance_profile.lab02_ec2_allow_s3.name

}

output "lab02_web01_public_ip" {

  value = aws_instance.lab02_web01.public_ip

}


resource "aws_instance" "lab02_web" {

  tags = {
    Name = "lab02_web"
  }

  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.lab02_web.id
  vpc_security_group_ids = [aws_security_group.lab02_web.id]

  key_name  = "id_rsa_arabadj.pub"
  user_data = data.aws_s3_bucket_object.bootstrap_web.body

  iam_instance_profile = aws_iam_instance_profile.lab02_ec2_allow_s3.name

  depends_on = [aws_internet_gateway.lab02_web]

}

output "lab02_web_public_ip" {

  value = aws_instance.lab02_web.public_ip

}


resource "aws_instance" "lab02_db" {

  tags = {
    Name = "lab02_db"
  }

  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.lab02_db.id
  vpc_security_group_ids = [aws_security_group.lab02_db.id]

  key_name  = "id_rsa_arabadj.pub"
  user_data = data.aws_s3_bucket_object.bootstrap_db.body

  iam_instance_profile = aws_iam_instance_profile.lab02_ec2_allow_s3.name

  depends_on = [aws_nat_gateway.lab02_db]

}

output "lab02_db_private_ip" {

  value = aws_instance.lab02_db.private_ip

}


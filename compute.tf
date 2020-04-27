resource "aws_instance" "lab01_vm01" {

  tags = {
    Name = "lab01_vm01"
  }

  ami                    = "ami-0323c3dd2da7fb37d"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.lab01.id]
  key_name               = "id_rsa_arabadj.pub"
  user_data              = file("../twink-common-aws/cloudconfig/amazon_nginx.yml")

  iam_instance_profile   = aws_iam_instance_profile.lab01_ec2_allow_s3.name

}

output "lab01_vm01_public_ip" {

  value = aws_instance.lab01_vm01.public_ip

}


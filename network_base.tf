resource "aws_vpc" "lab02" {

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "lab02"
  }

}


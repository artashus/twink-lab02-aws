resource "aws_vpc" "lab02" {

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "lab02"
  }

}

resource "aws_subnet" "lab02_web" {

  vpc_id     = aws_vpc.lab02.id
  cidr_block = "10.0.20.0/24"

  tags = {
    Name = "lab02_web"
  }
}

resource "aws_subnet" "lab02_db" {

  vpc_id     = aws_vpc.lab02.id
  cidr_block = "10.0.10.0/24"

  tags = {
    Name = "lab02_db"
  }
}


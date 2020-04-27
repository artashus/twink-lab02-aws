resource "aws_subnet" "lab02_db" {

  vpc_id     = aws_vpc.lab02.id
  cidr_block = cidrsubnet(aws_vpc.lab02.cidr_block, 8, 10)

  tags = {
    Name = "lab02_db"
  }

}

resource "aws_eip" "lab02_db" {
  vpc = true
}

resource "aws_nat_gateway" "lab02_db" {
  allocation_id = aws_eip.lab02_db.id
  subnet_id     = aws_subnet.lab02_web.id
  depends_on    = [aws_internet_gateway.lab02_web]
}

resource "aws_route_table" "lab02_db" {

  vpc_id = aws_vpc.lab02.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.lab02_db.id
  }

  tags = {
    Name = "lab02_db"
  }
}

resource "aws_route_table_association" "lab02_db" {

  subnet_id      = aws_subnet.lab02_db.id
  route_table_id = aws_route_table.lab02_db.id

}

resource "aws_security_group" "lab02_db" {

  name   = "lab02_db"
  vpc_id = aws_vpc.lab02.id

  ingress {
    from_port   = "-1"
    to_port     = "-1"
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "2222"
    to_port     = "2222"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "3306"
    to_port     = "3306"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


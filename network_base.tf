resource "aws_vpc" "lab02" {

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "lab02"
  }

}

resource "aws_network_acl" "lab02" {

  vpc_id = aws_vpc.lab02.id
  subnet_ids = [aws_subnet.lab02_web.id]

  ingress {
    protocol   = "all"
    rule_no    = 9999
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  
  egress {
    protocol   = "all"
    rule_no    = 9999
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "lab02"
  }

}


resource "aws_subnet" "lab02_web" {

  vpc_id                  = aws_vpc.lab02.id
  cidr_block              = "10.0.20.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "lab02_web"
  }

}

resource "aws_internet_gateway" "lab02_web" {
  vpc_id = aws_vpc.lab02.id

  tags = {
    Name = "lab02_web"
  }
}

resource "aws_route_table" "lab02_web" {

  vpc_id = aws_vpc.lab02.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab02_web.id
  }

  tags = {
    Name = "lab02_web"
  }
}

resource "aws_route_table_association" "lab02_web" {

  subnet_id      = aws_subnet.lab02_web.id
  route_table_id = aws_route_table.lab02_web.id

}

resource "aws_security_group" "lab02_web" {

  name   = "lab02_web"
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
    from_port   = "80"
    to_port     = "80"
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


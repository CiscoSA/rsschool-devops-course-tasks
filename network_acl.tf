resource "aws_network_acl" "public" {
  vpc_id = aws_vpc.main_vpc.id
  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

   tags = {
    Name = "Public"
  }
}

resource "aws_network_acl_association" "main" {
  count = length(var.public_subnets)

  network_acl_id = aws_network_acl.public.id
  subnet_id      = aws_subnet.public_subnet[count.index].id
}
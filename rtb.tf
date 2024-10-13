resource "aws_route_table" "public_rtb" {
  propagating_vgws = []
  route = [{
    carrier_gateway_id         = ""
    cidr_block                 = "0.0.0.0/0"
    core_network_arn           = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    gateway_id                 = aws_internet_gateway.gw.id
    # ipv6_cidr_block            = "::/0"
    ipv6_cidr_block            = null
    local_gateway_id           = ""
    nat_gateway_id             = ""
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_endpoint_id            = ""
    vpc_peering_connection_id  = ""
  }]
  tags = {
    Name = "project-rtb-public"
  }
  tags_all = {
    Name = "project-rtb-public"
  }
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public_subnet[0].id
  route_table_id = aws_route_table.public_rtb.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public_subnet[1].id
  route_table_id = aws_route_table.public_rtb.id
}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association

resource "aws_route_table" "private1_rtb" {
  propagating_vgws = []
  route = [{
    carrier_gateway_id         = ""
    cidr_block                 = "0.0.0.0/0"
    core_network_arn           = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    gateway_id                 = ""
    ipv6_cidr_block            = null
    local_gateway_id           = ""
    nat_gateway_id             = aws_nat_gateway.public1_gw.id
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_endpoint_id            = ""
    vpc_peering_connection_id  = ""
  }]
  tags = {
    Name = "project-rtb-private1-us-east-1a"
  }
  tags_all = {
    Name = "project-rtb-private1-us-east-1a"
  }
  vpc_id = aws_vpc.main_vpc.id
}



resource "aws_route_table" "private2_rtb" {
  propagating_vgws = []
  route = [{
    carrier_gateway_id         = ""
    cidr_block                 = "0.0.0.0/0"
    core_network_arn           = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    gateway_id                 = ""
    ipv6_cidr_block            = null
    local_gateway_id           = ""
    nat_gateway_id             = aws_nat_gateway.public2_gw.id
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_endpoint_id            = ""
    vpc_peering_connection_id  = ""
  }]
  tags = {
    Name = "project-rtb-private2-us-east-1b"
  }
  tags_all = {
    Name = "project-rtb-private2-us-east-1b"
  }
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private_subnet[0].id
  route_table_id = aws_route_table.private1_rtb.id
}
resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private_subnet[1].id
  route_table_id = aws_route_table.private2_rtb.id
}
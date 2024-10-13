# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_nat_gateway" "public1_gw" {
  allocation_id                      = aws_eip.eip-ngw1.id
  connectivity_type                  = "public"
  private_ip                         = "10.200.13.244"
  secondary_allocation_ids           = []
  # secondary_private_ip_address_count = 0
  # secondary_private_ip_addresses     = []
  subnet_id                          = aws_subnet.public_subnet[0].id
  tags = {
    Name = "project-nat-public1-us-east-1a"
  }
  tags_all = {
    Name = "project-nat-public1-us-east-1a"
  }
}

# __generated__ by Terraform
resource "aws_nat_gateway" "public2_gw" {
  allocation_id                      = aws_eip.eip-ngw2.id
  connectivity_type                  = "public"
  private_ip                         = "10.200.21.11"
  secondary_allocation_ids           = []
  # secondary_private_ip_address_count = 0
  # secondary_private_ip_addresses     = []
  subnet_id                          = aws_subnet.public_subnet[1].id
  tags = {
    Name = "project-nat-public2-us-east-1b"
  }
  tags_all = {
    Name = "project-nat-public2-us-east-1b"
  }
}

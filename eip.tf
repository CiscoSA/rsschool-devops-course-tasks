# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "eipalloc-07933341605881cb8"
resource "aws_eip" "eip-ngw2" {
  address                   = null
  associate_with_private_ip = null
  customer_owned_ipv4_pool  = null
  domain                    = "vpc"
  instance                  = null
  network_border_group      = var.aws_region
  # network_interface         = "eni-07e4f86fb57c5a83f"
  public_ipv4_pool          = "amazon"
  # depends_on                = [aws_nat_gateway.public2_gw]

  tags = {
    Name = "project-eip-us-east-1b"
  }
  tags_all = {
    Name = "project-eip-us-east-1b"
  }
}

# __generated__ by Terraform from "eipalloc-023480b3c1020860f"
resource "aws_eip" "eip-ngw1" {
  address                   = null
  associate_with_private_ip = null
  customer_owned_ipv4_pool  = null
  domain                    = "vpc"
  instance                  = null
  network_border_group      = var.aws_region
  # network_interface         = "eni-07e36d0ba1be10c54"
  public_ipv4_pool          = "amazon"

  # depends_on                = [aws_nat_gateway.public2_gw]

  tags = {
    Name = "project-eip-us-east-1a"
  }
  tags_all = {
    Name = "project-eip-us-east-1a"
  }
}

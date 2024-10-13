resource "aws_eip" "eip-ngw2" {
  address                   = null
  associate_with_private_ip = null
  customer_owned_ipv4_pool  = null
  domain                    = "vpc"
  instance                  = null
  network_border_group      = var.aws_region
  public_ipv4_pool = "amazon"

  tags = {
    Name = "project-eip-us-east-1b"
  }
  tags_all = {
    Name = "project-eip-us-east-1b"
  }
}

resource "aws_eip" "eip-ngw1" {
  address                   = null
  associate_with_private_ip = null
  customer_owned_ipv4_pool  = null
  domain                    = "vpc"
  instance                  = null
  network_border_group      = var.aws_region
  public_ipv4_pool = "amazon"

  tags = {
    Name = "project-eip-us-east-1a"
  }
  tags_all = {
    Name = "project-eip-us-east-1a"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public_subnet" {
  count  = length(var.public_subnets)
  vpc_id = aws_vpc.main_vpc.id
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "project-subnet-public${count.index + 1}-${var.aws_region}"
  }

}


resource "aws_subnet" "private_subnet" {
  count  = length(var.private_subnets)
  vpc_id = aws_vpc.main_vpc.id
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  cidr_block              = var.private_subnets[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name = "project-subnet-private${count.index + 1}-${var.aws_region}"
  }
}

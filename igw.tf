resource "aws_internet_gateway" "gw" {
  tags = {
    Name = "project-igw"
  }

  vpc_id = aws_vpc.main_vpc.id
}

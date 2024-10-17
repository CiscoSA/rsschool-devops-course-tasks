# resource "aws_instance" "nat_host" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type

#   network_interface {
#     network_interface_id = aws_network_interface.nat_host.id
#     device_index         = 0
#   }

#   user_data = templatefile("./userdata/nat_instance.sh.tpl", {})

#   tags = {
#     Name = "NAT-host"
#   }
# }

# resource "aws_network_interface" "nat_host" {
#   subnet_id       = aws_subnet.public_subnet[1].id
#   security_groups = [aws_security_group.public_sg.id]

#   source_dest_check = false
#   tags = {
#     Name = "Public-nat"
#   }
# }

# #############################################################################################

resource "aws_instance" "private1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  network_interface {
    network_interface_id = aws_network_interface.private1.id
    device_index         = 0
  }

  user_data = templatefile("./userdata/ssh-key.sh.tpl", {})
  tags = {
    Name = "Private-1"
  }
}

resource "aws_network_interface" "private1" {
  subnet_id       = aws_subnet.private_subnet[0].id
  security_groups = [aws_security_group.public_sg.id]


  source_dest_check = false
  tags = {
    Name = "Private-1"
  }
}

# ======================================================
resource "aws_instance" "private2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  network_interface {
    network_interface_id = aws_network_interface.private2.id
    device_index         = 0
  }

  user_data = templatefile("./userdata/ssh-key.sh.tpl", {})
  tags = {
    Name = "Private-2"
  }
}

resource "aws_network_interface" "private2" {
  subnet_id       = aws_subnet.private_subnet[1].id
  security_groups = [aws_security_group.public_sg.id]

  source_dest_check = false
  tags = {
    Name = "Private-2"
  }
}

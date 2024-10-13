data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}



resource "aws_instance" "public1" {
  ami           = data.aws_ami.ubuntu.id
#   associate_public_ip_address = true
  instance_type = var.instance_type

#   security_groups             = [aws_security_group.public_sg.id]
#   subnet_id                   = aws_subnet.public_subnet[0].id

  network_interface {
    network_interface_id = aws_network_interface.public1.id
    device_index         = 0
  }

  user_data = templatefile("./userdata/ssh-key.sh.tpl", { })
  tags = {
    Name = "Public-1"
  }
}

resource "aws_network_interface" "public1" {
  subnet_id       = aws_subnet.public_subnet[0].id
  security_groups = [aws_security_group.public_sg.id]
  

  # configure NAT to access internet from private subnets
  source_dest_check = false
  tags = {
    Name = "Public-1"
  }
}

# ======================================================
resource "aws_instance" "public2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  network_interface {
    network_interface_id = aws_network_interface.public2.id
    device_index         = 0
  }

  user_data = templatefile("./userdata/ssh-key.sh.tpl", { })

  tags = {
    Name = "Public-2"
  }
}

resource "aws_network_interface" "public2" {
  subnet_id       = aws_subnet.public_subnet[1].id
  security_groups = [aws_security_group.public_sg.id]
  
  source_dest_check = false
  tags = {
    Name = "Public-2"
  }
}

# #############################################################################################

resource "aws_instance" "private1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  network_interface {
    network_interface_id = aws_network_interface.private1.id
    device_index         = 0
  }

  user_data = templatefile("./userdata/ssh-key.sh.tpl", { })
  tags = {
    Name = "Private-1"
  }
}

resource "aws_network_interface" "private1" {
  subnet_id       = aws_subnet.private_subnet[0].id
  security_groups = [aws_security_group.public_sg.id]
  

  # configure NAT to access internet from private subnets
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

  user_data = templatefile("./userdata/ssh-key.sh.tpl", { })
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

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  network_interface {
    network_interface_id = aws_network_interface.bastion.id
    device_index         = 0
  }

  user_data = templatefile("./userdata/ssh-key.sh.tpl", {})
  tags = {
    Name = "Bastion"
  }
}

resource "aws_network_interface" "bastion" {
  subnet_id       = aws_subnet.public_subnet[0].id
  security_groups = [aws_security_group.public_sg.id]

  source_dest_check = false
  tags = {
    Name = "Bastion"
  }
}

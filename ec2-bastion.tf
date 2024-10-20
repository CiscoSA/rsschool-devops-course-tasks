resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id = module.vpc.public_subnets[0]

  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.public_sg.id]

  user_data = templatefile("./userdata/ec2.sh.tpl", {})
  tags = {
    Name = "Bastion"
  }
}

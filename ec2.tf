resource "aws_instance" "private1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type_k8s

  subnet_id = module.vpc.private_subnets[0]

  vpc_security_group_ids = [aws_security_group.public_sg.id]


  user_data = templatefile("./userdata/ec2.sh.tpl", {})
  tags = {
    Name = "control-plane"
  }
}

# ======================================================
resource "aws_instance" "private2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type_k8s

  subnet_id = module.vpc.private_subnets[1]

  vpc_security_group_ids = [aws_security_group.public_sg.id]

  user_data = templatefile("./userdata/ec2.sh.tpl", {})
  tags = {
    Name = "worker"
  }
}


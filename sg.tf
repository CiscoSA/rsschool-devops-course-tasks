resource "aws_security_group" "public_sg" {
  name        = "public_sg"
  description = "SG for public EC2"
  vpc_id      = aws_vpc.main_vpc.id
  tags = {
    Name = "public_sg"
  }
}

## Private SG rules START
resource "aws_security_group_rule" "allow_http_public_sg" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_sg.id
}
resource "aws_security_group_rule" "allow_ssh_public_sg" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "allow_icmp_public_sg" {
  type                     = "ingress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_sg.id
}

resource "aws_security_group_rule" "egress_public_sg" {
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_sg.id
}



# ## Private SG
# resource "aws_security_group" "private1_sg" {
#   name        = "${module.naming.resource_prefix.security_group}-private1_sg"
#   description = "SG for private EC2"
#   vpc_id      = module.vpc.vpc_id

#   tags = {
#     Name = "${module.naming.resource_prefix.security_group}-private1_sg"
#   }
# }

# ## Private SG rules START
# resource "aws_security_group_rule" "allow_http_private1_sg" {
#   count                    = var.deploy_task_resources ? 1 : 0
#   type                     = "ingress"
#   from_port                = 80
#   to_port                  = 80
#   protocol                 = "tcp"
#   security_group_id        = aws_security_group.private1_sg.id
#   source_security_group_id = aws_security_group.public1_sg.id
# }

# resource "aws_security_group_rule" "allow_icmp_private1_sg" {
#   count                    = var.deploy_task_resources ? 1 : 0
#   type                     = "ingress"
#   from_port                = -1
#   to_port                  = -1
#   protocol                 = "icmp"
#   security_group_id        = aws_security_group.private1_sg.id
#   source_security_group_id = aws_security_group.public1_sg.id
# }

# resource "aws_security_group_rule" "egress_private1_sg" {
#   type              = "egress"
#   from_port         = -1
#   to_port           = -1
#   protocol          = -1
#   cidr_blocks       = ["0.0.0.0/0"]
#   ipv6_cidr_blocks  = ["::/0"]
#   security_group_id = aws_security_group.private1_sg.id
# }
# ## Private SG rules END

# ## Public SG
# resource "aws_security_group" "public1_sg" {
#   name        = "${module.naming.resource_prefix.security_group}-public1_sg"
#   description = "SG for public EC2"
#   vpc_id      = module.vpc.vpc_id

#   tags = {
#     Name = "${module.naming.resource_prefix.security_group}-public1_sg"
#   }
# }

# ## Private SG rules START
# resource "aws_security_group_rule" "allow_http_public1_sg" {
#   count                    = var.deploy_task_resources ? 1 : 0
#   type                     = "ingress"
#   from_port                = 80
#   to_port                  = 80
#   protocol                 = "tcp"
#   security_group_id        = aws_security_group.public1_sg.id
#   source_security_group_id = aws_security_group.private1_sg.id
# }

# resource "aws_security_group_rule" "allow_icmp_public1_sg" {
#   count                    = var.deploy_task_resources ? 1 : 0
#   type                     = "ingress"
#   from_port                = -1
#   to_port                  = -1
#   protocol                 = "icmp"
#   security_group_id        = aws_security_group.public1_sg.id
#   source_security_group_id = aws_security_group.private1_sg.id
# }

# resource "aws_security_group_rule" "egress_public1_sg" {
#   type              = "egress"
#   from_port         = -1
#   to_port           = -1
#   protocol          = -1
#   cidr_blocks       = ["0.0.0.0/0"]
#   ipv6_cidr_blocks  = ["::/0"]
#   security_group_id = aws_security_group.public1_sg.id
# }
# ## Private SG rules END

# ## SSM SG
# resource "aws_security_group" "session-manager-connectivity" {
#   name        = "${module.naming.resource_prefix.security_group}-session-manager-connectivity"
#   description = "SG for SSM"
#   vpc_id      = module.vpc.vpc_id

#   tags = {
#     Name = "${module.naming.resource_prefix.security_group}-session-manager-connectivity"
#   }
# }

# ## SSM SG rules START
# resource "aws_security_group_rule" "allow_ssm_private1_sg" {
#   type                     = "ingress"
#   from_port                = 443
#   to_port                  = 443
#   protocol                 = "tcp"
#   security_group_id        = aws_security_group.session-manager-connectivity.id
#   source_security_group_id = aws_security_group.private1_sg.id
# }

# resource "aws_security_group_rule" "allow_ssm_public1_sg" {
#   type                     = "ingress"
#   from_port                = 443
#   to_port                  = 443
#   protocol                 = "tcp"
#   security_group_id        = aws_security_group.session-manager-connectivity.id
#   source_security_group_id = aws_security_group.public1_sg.id
# }
# ## SSM SG rules END


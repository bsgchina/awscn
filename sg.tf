data "aws_security_groups" "tfe-sg" {
  filter {
    name   = "group-name"
    values = ["tfe-sg"]
  }

#  filter {
#    name   = "vpc-id"
#    #values = ["${var.vpc_id}"]
#    values = ["vpc-fef57297"]
#  }

}

#resource "aws_security_group_rule" "tcp-ipv4-6060" {
#  type              = "ingress"
#  from_port         = 6060
#  to_port           = 6060
#  protocol          = "tcp"
#  cidr_blocks       = ["0.0.0.0/0"]
#  security_group_id = data.aws_security_groups.tfe-sg.ids[0]
#}


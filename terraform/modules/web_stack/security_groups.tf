resource "aws_security_group" "alb" {
  name        = "${local.name_prefix}-web-stack-alb"
  description = "web stack load balancer"
  vpc_id      = var.vpc_id
  tags = merge(
    var.tags,
    {
      "Name" : "${local.name_prefix}-web-stack-alb"
    }
  )
}

resource "aws_security_group" "instances" {
  name        = "${local.name_prefix}-web-stack-instances"
  description = "web stack instances"
  vpc_id      = var.vpc_id
  tags = merge(
    var.tags,
    {
      "Name" : "${local.name_prefix}-web-stack-instances"
    }
  )
}

############
# SG RULES #
############


### Load Balancer

resource "aws_security_group_rule" "load_balancer_https_from_internet" {
  description       = "public internet https access to web_stack load balancer"
  security_group_id = aws_security_group.alb.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "load_balancer_https_to_instances" {
  description              = "https access from load balancer to web_stack"
  security_group_id        = aws_security_group.alb.id
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.instances.id
}


### Web_Stack

resource "aws_security_group_rule" "https_from_load_balancer" {
  description              = "allow https to instances from load balancer"
  security_group_id        = aws_security_group.instances.id
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.alb.id
}

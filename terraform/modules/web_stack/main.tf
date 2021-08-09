resource "aws_instance" "instance_1" {
  ami             = data.aws_ami.web_stack.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instances.id]
  subnet_id       = var.private_subnet_b_id
  tags = merge(
    var.tags,
    {
      "Name" : "${local.name_prefix}-web-stack-instance-1"
    }
  )
}

resource "aws_instance" "instance_2" {
  ami             = data.aws_ami.web_stack.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instances.id]
  subnet_id       = var.private_subnet_a_id
  tags = merge(
    var.tags,
    {
      "Name" : "${local.name_prefix}-web-stack-instance-2"
    }
  )
}

resource "aws_instance" "instance_3" {
  ami             = data.aws_ami.web_stack.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instances.id]
  subnet_id       = var.private_subnet_c_id
  tags = merge(
    var.tags,
    {
      "Name" : "${local.name_prefix}-web-stack-instance-3"
    }
  )
}


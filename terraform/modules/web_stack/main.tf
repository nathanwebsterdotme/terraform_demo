resource "aws_instance" "instance_1" {
  ami             = data.aws_ami.web_stack.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instances.id]
  subnet_id       = var.private_subnet_a_id
  tags = merge(
    var.tags,
    {
      "Name" : "${local.name_prefix}-web-stack-instance-1"
    }
  )
}

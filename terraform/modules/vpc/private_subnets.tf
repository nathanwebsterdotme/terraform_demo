resource "aws_subnet" "private_a" {
  cidr_block = var.vpc_subnet_private_a_cidr
  tags = merge(
    var.tags,
    {
      "Name" = "${local.name_prefix}-private-a"
    }
  )
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "private_b" {
  cidr_block = var.vpc_subnet_private_b_cidr
  tags = merge(
    var.tags,
    {
      "Name" = "${local.name_prefix}-private-b"
    }
  )
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "private_c" {
  cidr_block = var.vpc_subnet_private_c_cidr
  tags = merge(
    var.tags,
    {
      "Name" = "${local.name_prefix}-private-c"
    }
  )
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "public_a" {
  cidr_block = var.vpc_subnet_public_a_cidr
  tags = merge(
    var.tags,
    {
      "Name" = "${local.name_prefix}-public-a"
    }
  )
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "public_b" {
  cidr_block = var.vpc_subnet_public_b_cidr
  tags = merge(
    var.tags,
    {
      "Name" = "${local.name_prefix}-public-b"
    }
  )
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "public_c" {
  cidr_block = var.vpc_subnet_public_c_cidr
  tags = merge(
    var.tags,
    {
      "Name" = "${local.name_prefix}-public-c"
    }
  )
  vpc_id = aws_vpc.vpc.id
}

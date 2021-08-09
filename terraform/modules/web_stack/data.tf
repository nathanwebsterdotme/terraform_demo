data "aws_ami" "web_stack" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-6.10_HVM_GA-20180810-x86_64-0-Hourly2-GP2"]
    # values = ["RHEL-7.9_HVM_GA-20200917-x86_64-0-Hourly2-GP2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["309956199498"] # Red Hat
}


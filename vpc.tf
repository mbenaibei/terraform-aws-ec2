# Create a custom VPC to isolate the DevOps lab network environment
resource "aws_vpc" "devops_lab_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}
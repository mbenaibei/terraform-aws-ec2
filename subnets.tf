# Create a public subnet with automatic public IP assignment for internet-facing resources
resource "aws_subnet" "devops_lab_subnet" {
  vpc_id                  = aws_vpc.devops_lab_vpc.id
  cidr_block              = cidrsubnet("${var.vpc_cidr}", 8, 1)
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-subnet"
  }
}
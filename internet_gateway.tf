# Create an Internet Gateway to enable internet connectivity for resources inside the VPC
resource "aws_internet_gateway" "devops_lab_igw" {
  vpc_id = aws_vpc.devops_lab_vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}
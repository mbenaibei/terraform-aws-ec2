# Create a public route table to define internet-bound traffic routing
resource "aws_route_table" "devops_lab_rtb" {
  vpc_id = aws_vpc.devops_lab_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops_lab_igw.id
  }

  tags = {
    Name = "${var.project_name}-rtb"
  }
}

# Associate the public subnet with the public route table
resource "aws_route_table_association" "devops_lab_assoc" {
  subnet_id      = aws_subnet.devops_lab_subnet.id
  route_table_id = aws_route_table.devops_lab_rtb.id
}
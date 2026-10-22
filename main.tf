# Launch an EC2 instance configured as a web server
resource "aws_instance" "webserver" {
  ami                         = data.aws_ami.debian.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.devops_lab_subnet.id
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.devops_lab_sg.id]
  key_name                    = var.key_name
  user_data                   = file("scripts/user_data.sh")
  root_block_device {
    volume_type = var.root_volume_type
    volume_size = var.root_volume_size
    encrypted   = var.root_volume_encrypted
  }
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name = "${var.project_name}-${var.instance_name}"
  }
}

# Create a Snapshot of the instance EBS Root Volume
/*
resource "aws_ebs_snapshot" "webserver_volume_snapshot" {
  volume_id   = aws_instance.webserver.root_block_device[0].volume_id
  description = "Snapshot of the webserver"

  tags = {
    Name = "${var.project_name}-${aws_instance.webserver.root_block_device[0].volume_id}-snapshot"
  }
}
*/

# Create an Elastic IP to associate to instance
resource "aws_eip" "devops_lab_eip" {
  domain = "vpc"

  tags = {
    Name = "devops-lab-eip"
  }
}

# Associate the Elastic IP to instance
resource "aws_eip_association" "webserver_eip_association" {
  instance_id   = aws_instance.webserver.id
  allocation_id = aws_eip.devops_lab_eip.id
}
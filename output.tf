# Define output values to expose important infrastructure information

output "webserver_availability_zone" {
  value = aws_instance.webserver.availability_zone
}

output "webserver_id" {
  value = aws_instance.webserver.id
}

output "webserver_instance_type" {
  value = aws_instance.webserver.instance_type
}

output "webserver_public_dns" {
  value = aws_eip.devops_lab_eip.public_dns
}

output "webserver_public_ip" {
  value = aws_eip.devops_lab_eip.public_ip
}
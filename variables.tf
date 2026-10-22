# AWS Provider Configuration
variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "eu-west-3"
}

variable "aws_profile" {
  description = "AWS CLI profile used for authentication"
  type        = string
  default     = "terraform-dev"
}


# Project Configuration
variable "project_name" {
  description = "Project name used for resource naming and tagging"
  type        = string
  default     = "devops-lab"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}


# Network Configuration
variable "vpc_cidr" {
  description = "CIDR block assigned to the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block assigned to the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability Zone where resources will be deployed"
  type        = string
  default     = "eu-west-3a"
}


# EC2 Configuration
variable "ami_owner" {
  description = "AWS account ID owning the AMI"
  type        = string
  default     = "136693071363"
}

variable "ami_name_filter" {
  description = "AMI name filter used to find the Debian image"
  type        = string
  default     = "debian-13-amd64-*"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH key pair name used to access the EC2 instance"
  type        = string
  default     = "devops-lab"
}


# Storage Configuration
variable "root_volume_type" {
  description = "Root EBS volume type"
  type        = string
  default     = "gp3"
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB"
  type        = number
  default     = 20
}

variable "root_volume_encrypted" {
  description = "Enable EBS volume encryption"
  type        = bool
  default     = true
}


# Security Group Configuration
variable "ssh_allowed_cidr" {
  description = "CIDR blocks allowed to access SSH"
  type        = list(string)
  default = [
    "0.0.0.0/0"
  ]
}

variable "allowed_http_ports" {
  description = "Allowed HTTP ports"
  type        = list(number)
  default = [
    80
  ]
}

variable "allowed_https_ports" {
  description = "Allowed HTTPS ports"
  type        = list(number)
  default = [
    443
  ]
}


# Instance Configuration
variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "webserver"
}
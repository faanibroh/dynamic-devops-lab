variable "aws_region" {
  description = "AWS region for infrastructure"
  type        = string
  default     = "ap-southeast-2"
}

variable "project_name" {
  description = "Name of the DevOps project"
  type        = string
  default     = "dynamic-devops-lab"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "vpc_id" {
  description = "Existing AWS VPC ID"
  type        = string
  default     = "vpc-0e5e54559bb3a9031"
}

variable "subnet_id" {
  description = "Existing AWS subnet ID"
  type        = string
  default     = "subnet-066094d944b2ae4e1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB"
  type        = number
  default     = 8
}

variable "ssh_allowed_cidr" {
  description = "CIDR allowed to SSH into the target"
  type        = string
  default     = "172.31.0.0/16"
}

variable "key_name" {
  description = "Existing AWS EC2 key pair"
  type        = string
  default     = "devops-lab-key"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
  default     = ""
}

variable "controller_security_group_id" {
  description = "Security group ID of the Terraform controller"
  type        = string
  default     = "sg-0856e524a16ac807d"
}

variable "http_allowed_cidr" {
  description = "CIDR allowed to access HTTP"
  type        = string
  default     = "0.0.0.0/0"
}

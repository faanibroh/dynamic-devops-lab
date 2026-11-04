# Retrieve the latest Ubuntu 24.04 AMI
data "aws_ssm_parameter" "ubuntu_ami" {
  name = "/aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
}

locals {
  ami_id = var.ami_id != "" ? var.ami_id : data.aws_ssm_parameter.ubuntu_ami.value
}

# Security group for the target instance
resource "aws_security_group" "target" {
  name        = "${var.project_name}-${var.environment}-sg"
  description = "Security group for dynamic DevOps lab"
  vpc_id      = var.vpc_id

  ingress {
    description     = "SSH from controller"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [var.controller_security_group_id]
  }

  ingress {
    description = "HTTP from allowed CIDR"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.http_allowed_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-sg"
    Project     = var.project_name
    Environment = var.environment
  }
}

# EC2 target instance
resource "aws_instance" "target" {
  ami                         = local.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.target.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-target"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

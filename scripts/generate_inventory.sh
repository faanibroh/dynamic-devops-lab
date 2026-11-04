#!/bin/bash

set -euo pipefail

# Determine project directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

TF_DIR="$PROJECT_ROOT/terraform/aws"
INVENTORY_DIR="$PROJECT_ROOT/ansible/inventory"

# Retrieve target IP directly from Terraform
TARGET_IP="$(terraform -chdir="$TF_DIR" output -raw instance_private_ip)"

# Create inventory directory if missing
mkdir -p "$INVENTORY_DIR"

# Generate Ansible inventory
cat > "$INVENTORY_DIR/hosts.ini" <<EOF
[aws_targets]
aws_target ansible_host=$TARGET_IP ansible_user=ubuntu ansible_ssh_private_key_file=/home/ubuntu/.ssh/devops-lab-key.pem
EOF

echo "Ansible inventory generated successfully."
echo "Target IP: $TARGET_IP"
echo "Inventory: $INVENTORY_DIR/hosts.ini"

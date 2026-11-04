# Dynamic DevOps Lab

![Terraform CI](https://github.com/faanibroh/dynamic-devops-lab/actions/workflows/ci.yml/badge.svg)
![Ansible Lint](https://github.com/faanibroh/dynamic-devops-lab/actions/workflows/ansible-lint.yml/badge.svg)
![ShellCheck](https://github.com/faanibroh/dynamic-devops-lab/actions/workflows/shellcheck.yml/badge.svg)
![TFLint](https://github.com/faanibroh/dynamic-devops-lab/actions/workflows/tflint.yml/badge.svg)

A hands-on DevOps project demonstrating AWS infrastructure provisioning with Terraform, configuration management using Ansible, and automated code quality checks through GitHub Actions.

The project focuses on building, configuring, and validating cloud infrastructure using practical DevOps tools and automation practices.

## Project Overview

This project demonstrates:

- AWS infrastructure provisioning using Terraform
- EC2 instance management
- Ansible-based configuration management
- Reusable Ansible roles
- Dynamic inventory generation from Terraform outputs
- SSH-based remote configuration
- Terraform validation and linting
- Ansible linting and syntax validation
- Shell script quality checks
- Automated CI workflows using GitHub Actions

## Architecture

```text
                  GitHub Repository
                         |
                         v
                  GitHub Actions
                         |
          +--------------+--------------+
          |              |              |
          v              v              v
      Terraform       Ansible       ShellCheck
        CI             Lint
          |
          v
      TFLint
          |
          v
     AWS Infrastructure
          |
          v
       AWS EC2
          |
          v
     Ansible SSH
          |
          v
   Configuration Management
          |
          v
    Nginx Web Server
```

## Technology Stack

| Category | Technologies |
|---|---|
| Cloud | AWS |
| Infrastructure as Code | Terraform |
| Configuration Management | Ansible |
| CI/CD | GitHub Actions |
| Version Control | Git, GitHub |
| Operating System | Ubuntu 24.04 |
| Web Server | Nginx |
| Shell Scripting | Bash |
| Code Quality | TFLint, Ansible Lint, ShellCheck |

## Project Structure

```text
dynamic-devops-lab/
├── .github/
│   └── workflows/
│       ├── ci.yml
│       ├── ansible-lint.yml
│       ├── shellcheck.yml
│       └── tflint.yml
│
├── terraform/
│   └── aws/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── versions.tf
│       └── .terraform.lock.hcl
│
├── ansible/
│   ├── ansible.cfg
│   ├── inventory/
│   │   └── hosts.ini.example
│   ├── playbooks/
│   │   └── site.yml
│   └── roles/
│       ├── common/
│       ├── users/
│       ├── security/
│       └── nginx/
│
├── scripts/
│   └── generate_inventory.sh
│
├── .gitignore
└── README.md
```

## AWS Infrastructure

Terraform is used to provision and manage AWS infrastructure.

The project uses:

- AWS VPC
- Existing AWS subnet
- EC2 instance
- Security groups
- Ubuntu 24.04 AMI
- SSH-based administration

The infrastructure is designed to use existing AWS networking resources where appropriate.

### Terraform Commands

Navigate to the AWS Terraform directory:

```bash
cd terraform/aws
```

Format Terraform files:

```bash
terraform fmt
```

Initialize Terraform:

```bash
terraform init
```

Validate the configuration:

```bash
terraform validate
```

Check the proposed infrastructure changes:

```bash
terraform plan
```

Check formatting without modifying files:

```bash
terraform fmt -check -recursive
```

## Ansible Configuration Management

Ansible is used to configure the AWS EC2 target through SSH.

### Ansible Roles

| Role | Purpose |
|---|---|
| common | Installs common system utilities |
| users | Creates and manages users |
| security | Configures security-related packages and updates |
| nginx | Installs and configures Nginx |

### Dynamic Inventory

The project includes a script that generates Ansible inventory using Terraform outputs.

Generate the inventory:

```bash
./scripts/generate_inventory.sh
```

The generated inventory is stored in:

```text
ansible/inventory/hosts.ini
```

The actual inventory file is excluded from Git to avoid exposing environment-specific information.

### Ansible Commands

Navigate to the Ansible directory:

```bash
cd ansible
```

Check connectivity:

```bash
ansible aws_targets -m ping
```

Validate the playbook syntax:

```bash
ansible-playbook playbooks/site.yml --syntax-check
```

Preview changes:

```bash
ansible-playbook playbooks/site.yml --check
```

Apply the configuration:

```bash
ansible-playbook playbooks/site.yml
```

## GitHub Actions CI/CD

This project uses GitHub Actions to automatically validate Terraform, Ansible, and shell scripts.

The workflows run on pushes and pull requests targeting the `main` branch.

### Automated Workflows

| Workflow | Purpose |
|---|---|
| DevOps Infrastructure CI | Terraform formatting, initialization, validation, and Ansible syntax checks |
| Ansible Lint | Checks Ansible best practices |
| ShellCheck | Validates shell scripts |
| TFLint | Checks Terraform code for potential issues |

All four workflows have successfully passed in GitHub Actions.

## Security Practices

This project follows basic infrastructure security practices:

- SSH key-based authentication
- Private key files excluded from Git
- Terraform state files excluded from Git
- Terraform plan files excluded from Git
- Environment-specific inventory excluded from Git
- Sensitive configuration files excluded from Git
- Security-related Ansible configuration
- Automated code quality checks

**Never commit AWS credentials, SSH private keys, Terraform state files, or sensitive configuration values to GitHub.**

## Getting Started

### Prerequisites

Install the following tools:

- Git
- Terraform
- AWS CLI
- Ansible
- TFLint
- ShellCheck

You will also need:

- An AWS account
- Appropriate AWS permissions
- An existing AWS VPC and subnet
- An SSH key pair
- GitHub account

### Clone the Repository

```bash
git clone https://github.com/faanibroh/dynamic-devops-lab.git
```

Navigate into the project:

```bash
cd dynamic-devops-lab
```

Configure AWS credentials and Terraform variables according to your environment.

Review the Terraform configuration and run `terraform plan` before applying infrastructure changes.

## Learning Objectives

This project demonstrates practical experience with:

- Infrastructure as Code
- Cloud infrastructure management
- Configuration management
- Linux administration
- SSH connectivity
- Git and GitHub workflows
- CI automation
- Infrastructure validation
- Code linting and quality assurance
- AWS cloud fundamentals

## Author

**Muhammad Farhan Ali**

- GitHub: [@faanibroh](https://github.com/faanibroh)
- LinkedIn: [Muhammad Farhan Ali](https://www.linkedin.com/in/faanibroh/)

---

⭐ If you find this project useful, feel free to explore the repository and follow my DevOps learning journey.

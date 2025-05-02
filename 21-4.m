# Use the AWS provider
provider "aws" {
  region = "us-east-1"  # change to your desired region
}

# Module: Security Group for the EC2 instance
module "vote_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "user-service"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = "vpc-12345678"  # replace with your actual VPC ID

  ingress_cidr_blocks      = ["10.10.0.0/16"]
  ingress_rules            = ["https-443-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "10.10.0.0/16"
    },
    {
      rule        = "postgresql-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

# EC2 Instance
resource "aws_instance" "web_server" {
  ami                    = "ami-0c02fb55956c7d316"  # Example Amazon Linux 2 AMI (update with a valid one for your region)
  instance_type          = "t2.micro"
  subnet_id              = "subnet-12345678"         # Replace with your actual subnet
  vpc_security_group_ids = [module.vote_service_sg.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Welcome to User Service</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "UserService-EC2"
  }
}




🧾 What is EOF in Terraform (or Bash)?
In your Terraform file, you see this:



user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Welcome to User Service</h1>" > /var/www/html/index.html
EOF

This is using something called a heredoc (short for "here document") to define a multi-line string.



# TERRAFORM.TFVARS

In variables.tf, you declare variables (like ami_id, vpc_id, etc.).

In terraform.tfvars, you assign values to those variables.

Terraform automatically reads the .tfvars file when you run terraform apply — so you don’t need to pass values manually in the command line.


provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "ansible_sg" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere; restrict in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ansible_instance" {
  ami                    = var.ami_id  # AMI ID for Amazon Linux 2 or another compatible OS
  instance_type          = var.instance_type
  key_name               = var.key_pair
  vpc_security_group_ids = [aws_security_group.ansible_sg.id]

  # Install Ansible via user data script
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install epel -y
              sudo yum install -y ansible
              EOF

  tags = {
    Name = "Ansible-Instance"
  }
}

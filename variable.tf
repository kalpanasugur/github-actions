variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_pair" {
  description = "The name of the key pair to use for SSH access"
  type        = string
}

variable "ami_id" {
  description = "The Amazon Machine Image (AMI) ID to use for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 in us-east-1; replace with region-appropriate AMI if needed
}

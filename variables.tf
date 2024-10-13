variable "aws_region" {
  description = "Default AWS region"
  default     = "us-east-1"
  type        = string
}

variable "state_s3_bucket" {
  description = "State S3 bucket name"
  default     = "terraform-state-rsschool-devops-course-tasks"
  type        = string
}

variable "project" {
  description = "Name of project"
  default     = "rsschool"
  type        = string
}

variable "repo" {
  description = "Name of repo"
  default     = "CiscoSA/rsschool-devops-course-tasks:*"
  # default     = "CiscoSA/rsschool-devops-course-tasks:ref:refs/heads/task_1*"
  type = string
}

variable "instance_type" {
  description = "Instance type"
  # default     = "t3.small"
  default     = "t3.micro"
  type        = string
}

# variable "ami" {
#   description = "AMI"
#   default     = "ami-005fc0f236362e99f"
#   type        = string
# }

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
  default     = ["10.200.0.0/20", "10.200.16.0/20"]
}

variable "private_subnets" {
  description = "List of CIDR blocks for public subnets"
  default     = ["10.200.128.0/20", "10.200.144.0/20"]
}

# variable "public_ec2_count" {
#   description = "public_ec2_count"
#   default     = 2
#   type = number
# }
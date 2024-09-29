variable "aws_region" {
  description = "Default AWS region"
  default     = "eu-central-1"
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

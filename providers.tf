provider "aws" {
  region = var.aws_region
  # profile = "test"
  default_tags {
    tags = {
      Project = "Task_2"
    }
  }
}
terraform {
  backend "s3" {
    bucket  = "terraform-state-rsschool-devops-course-tasks"
    key     = "terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}
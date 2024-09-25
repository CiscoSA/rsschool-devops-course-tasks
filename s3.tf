resource "random_integer" "this" {
  min = 1
  max = 1000000
}

resource "aws_s3_bucket" "this" {
  bucket        = "rsschool-devops-course-tasks-${random_integer.this.result}"
  force_destroy = true
}

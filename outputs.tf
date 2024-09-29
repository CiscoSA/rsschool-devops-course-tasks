output "aws_region" {
  value       = var.aws_region
  description = "The AWS region"
}

output "state_s3_bucket_name" {
  value = aws_s3_bucket.state_s3_bucket.bucket
}

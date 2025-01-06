resource "aws_s3_bucket" "vj_s3" {
  bucket = var.bucket  # Use the bucket name passed from the root module
}

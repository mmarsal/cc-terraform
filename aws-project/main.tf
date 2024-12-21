resource "random_string" "unique_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "website_bucket" {
  bucket = "cc-terraform-static-website-${random_string.unique_suffix.result}"
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "bucket_ownership_controls" {
  bucket = aws_s3_bucket.website_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access_block" {
  bucket = aws_s3_bucket.website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket_ownership_controls,
    aws_s3_bucket_public_access_block.bucket_public_access_block,
  ]

  bucket = aws_s3_bucket.website_bucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "index_file" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = "index.html"
  source       = "webapp/index.html"
  content_type = "text/html"
  acl          = "public-read"
}

output "object_url" {
  value = "https://${aws_s3_bucket.website_bucket.bucket}.s3.eu-central-1.amazonaws.com/${aws_s3_object.index_file.key}"
}

resource "aws_ecr_repository" "app_ecr_repo" {
  name = "app-repo"
  force_delete = true
}

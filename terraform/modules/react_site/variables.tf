
variable "bucket_name" {
  description = "S3 bucket name for hosting the static website"
  type        = string
}

variable "website_source_dir" {
  description = "Local directory path containing the built website files (e.g., the output from 'npm run build')"
  type        = string
}
resource "aws_s3_object" "object" {
  bucket = "${var.environment_name}-s3-${var.knox_id}"
  key    = "index.html"
  source = "index.html"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("index.html")
}

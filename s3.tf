resource "aws_s3_bucket" "example" {
  bucket = "${var.environment_name}-s3-${var.knox_id}"

  tags = merge(
    "${var.gbl-tags}","${var.pii-tag}","${var.public-tag}",
    { 
      Name = "${var.environment_name}-s3-${var.knox_id}"
    }
  )

}

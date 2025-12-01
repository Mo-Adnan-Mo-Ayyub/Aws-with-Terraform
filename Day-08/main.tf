resource "aws_s3_bucket" "bucket-1" {
  count  = 2
  bucket = var.bucket_names[count.index]
  #  bucket = tolist(var.bucket_names-set[count.index])

  tags = var.tags
}

resource "aws_s3_bucket" "bucket-2" {
  for_each = var.bucket_names-set
  bucket   = each.value # we can use each.key as well in set

  tags = var.tags

  depends_on = [aws_s3_bucket.bucket-1]
}
resource "aws_s3_bucket" "terraform-remote-state" {
  bucket = "terraform-remote-state-1610"
}

resource "aws_dynamodb_table" "terraform-remote-state" {
  name = "state-lock"
  billing_mode = "PROVISIONED"
  read_capacity = 1
  write_capacity = 1
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
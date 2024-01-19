terraform {
  backend "s3" {
    bucket         = "bucket-name"
    key            = "dev/eks"
    region         = "us-east-1"
    dynamodb_table = "table_name"
  }
}

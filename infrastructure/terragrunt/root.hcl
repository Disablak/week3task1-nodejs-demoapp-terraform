remote_state {
  backend = "s3"
  config = {
    bucket         = "w3t2-terraform-states"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "w3t2-terraform-locks"
  }
}
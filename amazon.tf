# Generic settings
provider "aws" {
  region  = "us-east-1"
  # AWS credential name:
  profile = "nordcloud-test"
}

resource "aws_eip" "lb" {
  instance = "${aws_instance.web.id}"
  vpc      = true
}

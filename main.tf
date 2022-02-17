provider "aws" {
  region     = "eu-central-1"
}

resource "aws_instance" "ter_aws_linux" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "aws_instance_by_terraform"
  }
}

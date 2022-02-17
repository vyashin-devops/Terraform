provider "aws" {
  access_key = ${{ secrets.ACCESS_KEY }}
  secret_key = ${{ secrets.SECRET_KEY }}
  region     = "eu-central-1"
}

resource "aws_instance" "ter_aws_linux" {
  ami           = "ami-00f22f6155d6d92c5"
  instance_type = "t2.micro"

  tags = {
    Name = "aws_instance_by_terraform"
  }
}

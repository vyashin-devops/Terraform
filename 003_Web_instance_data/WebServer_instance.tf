#=====================================================================
#
# Web Server
# AWS
#
#=====================================================================

provider "aws" {
  access_key = 
  secret_key = 
  region     = "eu-central-1"
}

resource "aws_instance" "LinuxWebServer" {
  count                  = 1
  ami                    = "ami-00f22f6155d6d92c5"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  user_data              = templatefile("user_data.sh.tpl", {
    f_name = "Vyacheslav"
    l_name = "Yashin"
    names = ["Jon","Ivan","Mike"]
  })
  
  tags = {
    Name = "aws_webserver_by_terraform"
  }
}

resource "aws_security_group" "my_webserver" {
  name        = "aws_web_server"
  description = "SecGroupforWebServerbyTerraform"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_webserver"
  }
}

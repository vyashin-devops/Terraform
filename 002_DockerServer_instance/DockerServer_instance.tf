#=====================================================================
#
# Docker + Docker-Compose Ubuntu
# AWS
#
#=====================================================================

provider "aws" {
  access_key = 
  secret_key = 
  region     = "eu-central-1"
}

resource "aws_instance" "docker_server" {
  count                  = 1
  ami                    = "ami-05f7491af5eef733a" # Ubuntu 20.04
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.docker_server.id]
  key_name               = "vyashin-key-frankfurt"
  user_data              =  templatefile("user_data.sh.tpl",{
    USER = "ubuntu"
  })

  tags = {
    Name = "aws_docker_server_by_terraform"
  }
}

resource "aws_security_group" "docker_server" {
  name        = "Dynamic_Security_Group"
  description = "DynamicSecGroupforDockerServerTerraform"


  dynamic "ingress" {
    for_each = ["22","80","443","5000","8080"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Dynamic_Security_Group_4_Docker"
  }
}
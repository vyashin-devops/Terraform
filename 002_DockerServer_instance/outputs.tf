output "Docker_Public_Id" {
 value = aws_instance.docker_server[0].id
}

output "Docker_Public_Ip" {
 value = aws_instance.docker_server[0].public_ip
}
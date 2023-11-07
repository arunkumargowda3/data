
resource "aws_instance" "web_server" {
   count = length(var.web_server)
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.SG.id]
  associate_public_ip_address = var.associate_public_ip_address
  depends_on                  = [aws_instance.Data_base]
  tags = {
    Name = var.web_server[count.index]
    #project     = var.web_server
    environment = var.env
  }
}
resource "aws_instance" "Data_base" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.SG.id]
  associate_public_ip_address = var.associate_public_ip_address
  depends_on                  = [aws_instance.project]
  provisioner "local-exec" {
    command = "ls"
  }

  tags = {
    Name        = "${var.instance_name}-${var.env_db}"
    environment = var.env_db
  }
}


resource "aws_instance" "project" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.SG.id]
  associate_public_ip_address = var.associate_public_ip_address

  #depends_on = [aws_instance.Data_base]
  provisioner "local-exec" {
    command = "ls"
  }
  tags = {
    Name        = "${var.instance_name}-${var.env}"
    project     = var.project
    environment = var.env
  }

}

resource "aws_vpc" "demo-vpc" {
  cidr_block = "172.31.0.0/16"
  tags = {
    Name = "demo-vpc1"
  }
}


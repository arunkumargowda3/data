
resource "aws_instance" "web_server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.SG.id]
  associate_public_ip_address = var.associate_public_ip_address
  depends_on                  = [aws_instance.Data_base]
  tags = {
    Name = "${var.instance_name}-${var.env}"
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


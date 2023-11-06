variable "instance_name" {
  description = "Name to be used on EC2 Instance"
  type        = string
  default     = "demo"
}

variable "project" {
  type    = string
  default = "Innovisk"
}

variable "ami" {
  description = "AMI ID used for Instance"
  type        = string
  default     = "ami-02f3f602d23f1659d"
  sensitive   = true
  #Replace the ami id for your requirement
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
  sensitive   = true
  #Replace the instance_type for your requirement
}

variable "subnet_id" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e"]
}

variable "env" {
  description = "Name of the environment"
  type        = string
}

variable "env_db" {
  description = "Name of the environment"
  type        = string
}

variable "instance_count" {
  default = "1"
}

variable "vpc" {
  description = "The name of the vpc the resources should live in"
  type        = string
}

variable "associate_public_ip_address" {
  description = "Associate public address for the Instance"
  type        = bool
  default     = true
}

#Output Variables


output "instance_public_ip" {
  value = aws_instance.project.public_ip
}

output "instance_private_ip" {
  value = aws_instance.project.private_ip
}


output "instance_name" {
  value = aws_instance.project.tags.Name
}

output "subnet_id" {
  value = aws_instance.project.subnet_id
}

output "availability_zone" {
  value = aws_instance.project.availability_zone
}
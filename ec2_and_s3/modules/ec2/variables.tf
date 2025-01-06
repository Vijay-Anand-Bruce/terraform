variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
}

variable "key_name" {
  description = "Key pair name for SSH access"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
}

variable "vpc_security_group_ids" {
  description = "Sec Grp ID"
}
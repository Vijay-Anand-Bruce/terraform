variable "aws_region" {
  description = "The AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The type of instance to use"
  type  = string
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type  = string
}

variable "volume_size" {
  description = "The size of the root volume in GB"
  type  = string
}

variable "instance_name" {
  description = "The name tag for the instance"
  type    = string
}

variable "key_name" {
  description = "The key name to use for the instance"
  type    = string
}

variable "key_path" {
  description = "The path to the private key file"
  type        = string
}

variable "ebs_volume" {
  description = "Attach ebs volume"
  default = "8"
}
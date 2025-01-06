module "ec2_instance" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id           # Root-level variable passed to the module
  instance_type = "t2.medium"   # Root-level variable passed to the module
  key_name      = var.key_name
  instance_name = var.instance_names
  vpc_security_group_ids = ["sg-0d0eca3dff162f3d9"]
}

module "s3_bucket" {
  source        = "./modules/s3"           # Root-level variable passed to the module
  bucket    = var.bucket
}

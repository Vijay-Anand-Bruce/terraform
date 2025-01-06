resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp2"
  }

  tags = {
    Name    = var.instance_name
    Billing = var.instance_name
  }
}

resource "aws_ebs_volume" "ebs" {
  availability_zone = "us-east-1b"
  size              = var.ebs_volume
  encrypted = true

  tags = {
    Name = "new_EBS"
  }
}

resource "aws_volume_attachment" "ebs_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs.id
  instance_id = aws_instance.web.id
}

resource "null_resource" "ansible_nginx" {
  depends_on = [aws_instance.web]

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${aws_instance.web.public_ip}, -u ubuntu --private-key ${var.key_path} Ansible/nginx-playbook.yml"
  }
}

resource "null_resource" "ansible_docker" {
  depends_on = [aws_instance.web]

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${aws_instance.web.public_ip}, -u ubuntu --private-key ${var.key_path} Ansible/docker-playbook.yml"
  }
}
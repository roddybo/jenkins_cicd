resource "aws_instance" "public_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.autodeploy.key_name

  // Other instance configurations...

  // Attach the primary EBS volume (default size)
  root_block_device {
    volume_size = 8  # Adjust the size based on your needs
  }

  // Attach an additional EBS volume (2 GB)
  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = 2
    volume_type = "gp2"  # Adjust volume type as needed
  }

  tags = {
    Name = var.name_tag
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apache2",
      "sudo systemctl enable apache2",
      "sudo systemctl start apache2"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/Users/admin/.ssh/id_rsa")  # Replace with the path to your private key file
      host        = self.public_ip
    }
  }
}

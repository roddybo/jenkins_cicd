provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

resource "aws_instance" "ubuntu_instance" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"  # Replace with your Ubuntu AMI ID
  instance_type = "t2.micro"                # Replace with your instance type
  key_name      = "your-key-pair-name"      # Replace with your key pair name

  subnet_id             = "your-subnet-id"           # Replace with your subnet ID
  vpc_security_group_ids = ["your-security-group-id"] # Replace with your security group ID

  tags = {
    Name = "MyInstance"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apache2",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/path/to/your/private-key.pem")  # Replace with the path to your private key file
      host        = self.public_ip
    }
  }
}

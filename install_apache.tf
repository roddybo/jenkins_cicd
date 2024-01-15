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

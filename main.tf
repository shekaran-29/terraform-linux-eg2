
terraform {
  required_providers {
    linux = {
      source = "TelkomIndonesia/linux"
      version = "0.7.0"
    }
  }
}

provider "linux" {
    host     = "192.168.235.131"
    port     = 22
}

resource "linux_file" "unnatifile" {
    path = "/tmp/testdir"
}

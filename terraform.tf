terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "bsgchina"

    workspaces {
      name = "awscn"
    }
  }
}

terraform {
  required_version = ">= 0.12"
}

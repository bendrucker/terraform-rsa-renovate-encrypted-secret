terraform {
  required_version = ">= 0.14"

  required_providers {
    rsa = {
      source  = "bendrucker/rsa"
      version = "~> 1"
    }
  }
}

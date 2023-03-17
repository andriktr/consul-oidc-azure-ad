terraform {
  required_version = ">= 1.0.8"  
  backend "local" {}

  required_providers {
    consul = {
      version = "~> 2.15.0"
    }
  }
}
provider "consul" {
  address    = "https://consul-dev.balticit.ifint.biz"
  datacenter = var.consul_datacenter
  token      = var.consul_token
}

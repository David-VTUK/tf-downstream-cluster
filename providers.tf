terraform {
  required_providers {
    rancher2 = {
      source = "rancher/rancher2"
      version = "3.1.1"
    }
  }
}

provider "rancher2" {
  insecure = true
  api_url = var.rancher2_url
  secret_key = var.rancher2_secret_key
  access_key = var.rancher2_access_key
}
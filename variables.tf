variable "rancher2_url" {
  type = string
  description = "URL of the Rancher API"
}

variable "rancher2_secret_key" {
  type = string
  description = "Secret key used to auth to Rancher server"
}

variable "rancher2_access_key" {
  type = string
  description = "Access key used to auth to Rancher server"
}

variable "vsphere_url" {
  type = string
  description = "vCenter API URL"
}

variable "vsphere_username" {
  type = string
  description = "Username for vCenter server"
}

variable "vsphere_password" {
  type = string
  description = "Password for vCenter server"
}

variable "vsphere_port" {
  type = string
  description = "vSphere port number"
}

variable "cluster_k8s_version" {
  type = string
  description = "Version of the downstream cluster"
}
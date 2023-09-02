resource "rancher2_cloud_credential" "vsphere-credentials" {
  name = "tf-vsphere"
  description = "Credentials used for Terraform"
  vsphere_credential_config {
    password = var.vsphere_password
    username = var.vsphere_username
    vcenter  = var.vsphere_url
    vcenter_port = var.vsphere_port
  }
}

resource "rancher2_machine_config_v2" "demo-cluster-machineconf" {
  generate_name = "demo-cluster-machineconf"
  vsphere_config {
    clone_from = "ubuntu-2204"
    cpu_count = "4"
    creation_type = "template"
    cfgparam = ["disk.enableUUID=true"]
    datacenter = "Homelab"
    datastore = "p-esxi2-nvme-2"
    disk_size = "40000"
    hostsystem = "p-esxi2.virtualthoughts.co.uk"
    memory_size = "6144"
    network = ["VDS-MGMT-DEFAULT"]
    pool = "Resources"
  }
}

resource "rancher2_cluster_v2" "demo-cluster" {
  kubernetes_version = var.cluster_k8s_version
  name               = "demo-cluster"

  rke_config {
    machine_pools {
      name = "aio"
      cloud_credential_secret_name = rancher2_cloud_credential.vsphere-credentials.id
      control_plane_role = true
      etcd_role = true
      worker_role = true
      quantity = 1
      machine_config {
        kind = rancher2_machine_config_v2.demo-cluster-machineconf.kind
        name = rancher2_machine_config_v2.demo-cluster-machineconf.name
      }
    }
  }
}

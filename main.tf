locals {
  prod_datacenter = module.production.datacenter_id
  prod_cluster = element([for x in module.production.cluster_ids: x.id if x.name == "Management"], 0)
  prod_common_network = element([for x in module.production.network_ids: x.id if x.name == "Common"], 0)
}

module "production" {
  source  = "app.terraform.io/grantorchard/module-data/vsphere"

  datacenter = "Core"
  clusters = ["Tenant", "Management"]
  networks = ["Common", "VM Network", "LS1"]
  datastore_clusters = ["prod-cluster"]
  templates = ["ubuntu-18.04-packer"]

}



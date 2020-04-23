output datacenter {
  value = module.production.datacenter_id
}

output cluster {
  value = local.prod_cluster
}

output network {
  value = local.prod_common_network
}
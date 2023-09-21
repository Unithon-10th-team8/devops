resource "vultr_kubernetes" "k8" {
  region = "icn"
  label     = "unithon-cluster"
  version = "v1.27.2+1"
}

resource "vultr_kubernetes_node_pools" "k8_node_pool" {
  cluster_id = vultr_kubernetes.k8.id
  node_quantity = 3
  plan = "vc2-2c-4gb"
  label = "unithon-main-node"
  auto_scaler = true
  min_nodes = 3
  max_nodes = 5
}

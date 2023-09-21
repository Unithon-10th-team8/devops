resource "vultr_kubernetes" "k8" {
  region = "icn"
  label     = "unithon-cluster"
  version = "v1.27.2+1"

  node_pools {
    node_quantity = 3
    plan = "vc2-2c-4gb"
    label = "main-node-pool"
    auto_scaler = true
    min_nodes = 3
    max_nodes = 5
  }
}
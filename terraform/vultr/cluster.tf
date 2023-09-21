resource "vultr_kubernetes" "k8" {
  region  = "icn"
  label   = "unithon-cluster"
  version = "v1.27.2+1"

  node_pools {
    label         = "unithon-main-node"
    node_quantity = 3
    plan          = "vc2-2c-4gb"
    auto_scaler   = true
    min_nodes     = 3
    max_nodes     = 5
  }
}

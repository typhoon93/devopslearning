# Resource: Kubernetes Storage Class
resource "kubernetes_storage_class_v1" "ebs_sc" {
  metadata {
    name = "ebs-sc"
  }
  # this only works in minikube
  storage_provisioner = "hostpath.csi.k8s.io" # run this first: minikube addons enable csi-hostpath-driver,
  volume_binding_mode = "WaitForFirstConsumer"
  allow_volume_expansion = "true"
  reclaim_policy = "Retain"
}
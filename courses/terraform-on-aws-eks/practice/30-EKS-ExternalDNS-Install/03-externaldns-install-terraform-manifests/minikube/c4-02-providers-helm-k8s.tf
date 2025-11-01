provider "kubernetes" {
  alias           = "minikube"
  config_path     = "~/.kube/config"
  config_context  = "minikube"
}

provider "helm" {
  alias = "minikube"
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "minikube"
  }
}
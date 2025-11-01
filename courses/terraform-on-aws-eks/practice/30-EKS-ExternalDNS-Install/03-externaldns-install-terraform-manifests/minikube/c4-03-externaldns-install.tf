# Resource: Helm Release - ExternalDNS (Minikube dry-run)
resource "helm_release" "external_dns" {
  provider  = helm.minikube
  name      = "external-dns"
  namespace = "default"

  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"

  # --- Image ---
  set {
    name  = "image.repository"
    value = "registry.k8s.io/external-dns/external-dns"
  }

  # --- Provider (still AWS, just simulated) ---
  set {
    name  = "provider"
    value = "aws"
  }

  # --- Force dry-run mode ---
  set {
    name  = "extraArgs[0]"
    value = "--dry-run"
  }

  # --- Optional: reduce log noise ---
  set {
    name  = "logLevel"
    value = "debug"
  }

  # --- Sync policy ---
  set {
    name  = "policy"
    value = "sync"
  }

  # --- Don’t bother with service account creation ---
  set {
    name  = "serviceAccount.create"
    value = "false"
  }
}

resource "kubernetes_secret_v1" "demo_tls_secret" {
  metadata {
    name = "demo-tls-secret"
  }

  type = "kubernetes.io/tls"

  data = {
    "tls.crt" = file("${path.module}/certs/localhost.crt")
    "tls.key" = file("${path.module}/certs/localhost.key")
  }
}

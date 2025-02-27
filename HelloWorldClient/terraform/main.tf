resource "helm_release" "client" {
  create_namespace = true
  name       = "client-svc"
  namespace  = "app1"
  chart      = "https://github.com/devops4solutions/springboot-helm-chart/releases/download/springboot-0.1.3/springboot-0.1.3.tgz"
 // version    = "15.2.1" # Ensure this matches the version you want
  values = [
    file("values_client.yaml") # Path to your custom values file
  ]
}
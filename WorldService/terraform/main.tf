resource "helm_release" "myapp" {
  name       = "world-svc"
  repository = "https://devops4solutions.github.io/springboot-helm-chart/" # Using the published Helm repo
  chart      = "springboot"
  namespace  = "app1"  # Change as per your setup
  version    = "0.1.5"    # Use the correct version from index.yaml
  create_namespace = "true"
  recreate_pods = true
  force_update = true
  values = [
    file("${path.module}/values_world.yaml")  # Optional: Use custom values file
  ]
}
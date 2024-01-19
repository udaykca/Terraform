output "id" {
  value = module.k8s-cluster.id
}

output "version" {
  value = module.k8s-cluster.version_id
}

output "k8s-sg" {
  value = module.k8s-cluster.k8s_security_group
}

output "worker-sg" {
  value = module.k8s-cluster.worker_security_group
}
}

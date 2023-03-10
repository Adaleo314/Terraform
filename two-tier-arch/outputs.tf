output "alb_public_url" {
  description = "Public URL for ALB"
  value       = module.two-tier-arch.alb_public_url
}


output "db_name" {
    description = "Database Name"
    value = module.two-tier-arch.db_name
}

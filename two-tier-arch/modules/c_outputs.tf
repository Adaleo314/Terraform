#ALB Outputs


output "alb_public_url" {
  description = "Public URL for ALB"
  value       = aws_lb.external_alb.dns_name
}


#DB Outputs
output "db_name" {
  description = "Database Name"
  value       = aws_db_instance.rds_instance.db_name
}

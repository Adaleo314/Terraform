
###VPC Outputs###
output "vpc_id" {
  value = aws_vpc.vpc.id
}



#ALB
output "alb_public_url" {
  description = "Public URL for Application Load Balancer"
  value       = aws_lb.external_alb.dns_name
}

#RDS
output "db_connect_string" {
  description = "MyRDS database connection string"
  value       = "server=${aws_db_instance.my_db.address}; database=ExampleDB; Uid=${var.db_username}; Pwd=${var.db_password}"
  sensitive   = true
}

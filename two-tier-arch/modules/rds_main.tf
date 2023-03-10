# RDS subnet group
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db_subnet_group"
  subnet_ids = [for i in aws_subnet.private_subnet : i.id]

  tags = {
    Name = "rds_subnet"
  }
}


# RDS database on mysql engine
resource "aws_db_instance" "rds_instance" {
  allocated_storage      = var.db_storage
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.id
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  multi_az               = true
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database_sg.id]

  tags = {
    Name = "TF_DB"
  }
}


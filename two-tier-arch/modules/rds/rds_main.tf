# RDS subnet group
resource "aws_db_subnet_group" "db_subnet" {
  name       = "rds"
  count = 2
  subnet_ids = [aws_subnet.private_subnet_cidr.id]

  tags = { 
     name = "rds_subnet"
  }
}


# RDS database on mysql engine
resource "aws_db_instance" "my_db" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.id
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  multi_az               = true
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database_sg.id]
}


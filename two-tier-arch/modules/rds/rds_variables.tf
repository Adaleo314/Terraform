# db engine
variable "db_engine" {
  description = "Database Engine"
  type        = string
  default     = "mysql"
}


# db engine version
variable "db_engine_version" {
  description = "Database Version"
  type        = string
  default     = "5.7"
}


# db name
variable "db_name" {
  description = "Name of Database"
  type        = string
  default     = "two_tier_db"
}


# db instance class
variable "db_instance_class" {
  description = "Database instance size"
  type        = string
  default     = "db.t2.micro"
}
             

# database username variable
variable "db_username" {
  description = "database admin username"
  type        = string
  sensitive   = true
  default = "user"
}


# database password variable
variable "db_password" {
  description = "database admin password"
  type        = string
  sensitive   = true
  default = "password"
}

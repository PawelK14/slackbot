resource "aws_db_instance" "rds_instance" {
    allocated_storage = 20
    identifier = "rds-terraform"
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "8.0.27"
    instance_class = "db.t2.micro"
    db_name = var.db_name
    username = var.username
    password = var.password
    publicly_accessible = false
    skip_final_snapshot = true

}

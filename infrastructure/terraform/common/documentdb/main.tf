resource "aws_docdb_subnet_group" "this" {
  name       = "${var.name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = var.tags
}

resource "aws_docdb_cluster" "this" {
  cluster_identifier      = "${var.name}-cluster"
  engine                  = "docdb"
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  db_subnet_group_name    = aws_docdb_subnet_group.this.name
  vpc_security_group_ids  = [aws_security_group.allow_communicate_with_ec2.id]

  tags = var.tags
}

resource "aws_docdb_cluster_instance" "this" {
  count              = var.instance_count
  identifier         = "${var.name}-instance-${count.index}"
  cluster_identifier = aws_docdb_cluster.this.id
  instance_class     = var.instance_class
  tags               = var.tags
}

resource "aws_security_group" "allow_communicate_with_ec2" {
  name        = "documentdb-sg"
  vpc_id      = var.vpc_id
  description = "Allow communicate with ec2"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "allow_ec2_to_docdb" {
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  security_group_id        = aws_security_group.allow_communicate_with_ec2.id
  source_security_group_id = var.ec2_sg_id
  description              = "Allow EC2 access to DocumentDB"
}
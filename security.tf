# set this iam role to create a dms instance (it can only exists in the prod environment but will be available for all resources)
resource "aws_iam_role" "dms_vpc_role" {
  count = var.environment == "prod" ? 1 : 0

  name = "dms-vpc-role"

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonDMSVPCManagementRole"
  ]

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Sid" : "",
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "dms.amazonaws.com"
      },
      "Action" : "sts:AssumeRole"
    }]
  })

  tags = {
    Module = "main"
    Name   = "dms-vpc-role"
  }
}
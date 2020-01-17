variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "Region that we wish to deploy into."
}
variable "account_profile" {
  type        = string
  default = "desktop-sdlc-preprod"
  description = "Profile permissions."
}

variable "zone_id" {
  default = "desktop-preprod.aws-int.thomsonreuters.com"
}

variable "domain" {
  default = "aws-int.thomsonreuters.com"
}

variable "FinancialIdentifier" {
  type        = number
  default     = 283711002
  description = "Financial Identifier that running costs should be attributed to."
}

variable "ResourceOwner" {
  type        = string
  default     = "himanshu.dadheech@refinitiv.com"
  description = "Name of the resource owner"
}

variable "ApplicationAssetInsightId" {
  type        = number
  default     = 205911
  description = "Application Asset ID - See https://assets.int.thomsonreuters.com for more details"
}

variable "EnvironmentType" {
  type        = string
  default     = "NONPROD"
  description = "Type of the environment. Allowed values are DEVELOPMENT,NONPROD,PROD"
}

variable "BastionMySqlSecurityGroup" {
  type        = string
  default     = "sg-01b302cc2eb56f92e"
  description = "Thomson Reuters security group to allow mysql from bastion https://thehub.thomsonreuters.com/docs/DOC-2407079"
}

variable "VpcId" {
  type    = string
  default = "vpc-01cb0529986eaa25a"
  description = "Select a VPC that allows instances access to the Internet."
}

variable "PublicSubnetId" {
  type        = string
  description = "Public subnets for ECS ELB, ** MUST BE SAME AZs AS SubnetId **"
}

variable "SubnetId" {
  type        = string
  description = "Private subnets to host all resources except ECS ELB, ** MUST BE SAME AZs AS PublicSubnetId **"
}

variable "HostedZoneName" {
  type        = string
  default     = "desktop-preprod.aws-int.thomsonreuters.com."
  description = "The domain to use for ECS hosting, you can find this in Route 53 console and CoE recommendations"
}

variable "check_iam_policy_arn" {
  description = "IAM Policy to be attached to role"
  type        = list
  default = ["arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
  "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"]
}

variable "aspnet_iam_policy_arn" {
  description = "IAM Policy to be attached to role"
  type        = list
  default = ["arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
  "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"]
}

variable "trustjobs_iam_policy_arn" {
  description = "IAM Policy to be attached to role"
  type        = list
  default = ["arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaSQSQueueExecutionRole",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
  "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"]
}

variable "ParentStackName" {
  type = string
}

variable "WebWorldSecurityGroup" {
  type        = string
  default     = "sg-0a3cb78a9b65e9a27"
  description = "Thomson Reuters security group to allow http trafic in"
}

variable "BastionSSHSecurityGroup" {
  type        = string
  default     = "sg-09975b091d2d28836"
  description = "Thomson Reuters security group to allow ssh from bastion"
}

variable "LBSubnetId" {
  type        = string
  description = "Public subnets for ELB, ** MUST BE SAME AZs AS SubnetId **"
}


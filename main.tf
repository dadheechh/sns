# provider "aws" {
 
#     region = var.region
#     profile = var.account_profile
# }

# AWS sns topic
resource "aws_sns_topic" "user_updates" {
  name = "a${var.ApplicationAssetInsightId}-${var.ParentStackName}-user-updates-topic"
  delivery_policy = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF
}
# subscribe SQS to the SNS event message 

resource "aws_sns_topic_subscription" "user_updates_subscription" {
  topic_arn            = "user_updates"
  protocol             = "sqs"
  endpoint             = aws_sqs_queue.TrustQueue.arn
}

resource "aws_sqs_queue" "TrustQueue" {
  name                       = "a${var.ApplicationAssetInsightId}-${var.ParentStackName}-TrustQueue"
  redrive_policy             = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.TrustDeadLetterQueue.arn}\",\"maxReceiveCount\":5}"
  visibility_timeout_seconds = 300
}

resource "aws_sqs_queue" "TrustDeadLetterQueue" {
  name = "a${var.ApplicationAssetInsightId}-${var.ParentStackName}-TrustDeadLetterQueue"
}
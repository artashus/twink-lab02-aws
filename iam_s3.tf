resource "aws_iam_role" "lab02_ec2_allow" {
  name = "lab02_ec2_allow"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_role_policy" "lab02_ec2_allow_s3" {

  name = "lab02_ec2_allow_s3"
  role = aws_iam_role.lab02_ec2_allow.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::twink-lab02",
                "arn:aws:s3:::twink-lab02/*",
                "arn:aws:s3:::twink-lab02",
                "arn:aws:s3:::twink-lab02/*"
            ]
        }
    ]
}
EOF

}

resource "aws_iam_instance_profile" "lab02_ec2_allow_s3" {

  name = "lab02_ec2_allow_s3"
  role = aws_iam_role.lab02_ec2_allow.name

}

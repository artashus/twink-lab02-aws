resource "aws_iam_role" "lab01_ec2_allow" {
  name = "lab01_ec2_allow"

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

resource "aws_iam_role_policy" "lab01_ec2_allow_s3" {

  name = "lab01_ec2_allow_s3"
  role = aws_iam_role.lab01_ec2_allow.id

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
                "arn:aws:s3:::twink-common",
                "arn:aws:s3:::twink-common/*",
                "arn:aws:s3:::twink-lab01",
                "arn:aws:s3:::twink-lab01/*"
            ]
        }
    ]
}
EOF

}

resource "aws_iam_instance_profile" "lab01_ec2_allow_s3" {

  name = "lab01_ec2_allow_s3"
  role = aws_iam_role.lab01_ec2_allow.name

}

aws iam create-role --role-name lambda-ex --assume-role-policy-document '{"Version": "2012-10-17", "Statement": [{ "Effect": "Allow", "Principle": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'

aws iam create-role --role-name lambda-ex --assume-role-policy-document file://trust-policy.json

aws iam attach-role-policy --role-name lambda-ex --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

aws lambda create-function --function-name go-simple-lambda \ --zip-file fileeb://main.zip --handler main --runtime go1.x --role arn:aws:iam::<amazon account id>:role/lambda-ex

aws lambda invoke --function-name go-simple-lambda --cli-binary-format raw-in-base64-out --payload '{"What is your name?": "Jim?", "How old are you?": 33}' output.txt

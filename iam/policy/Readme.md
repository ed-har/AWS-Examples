## Convert to JSON
./json-to-yaml

## Create IAM Policy
```sh
aws iam create-policy \
--policy-name my-policy \
--policy-document file://policy.json
```

## Attach IAM Policy
```sh
aws iam attach-user-policy \
--policy-arn arn:aws:iam::597088034103:policy/my-policy \
--user-name EdwinHarianto
```
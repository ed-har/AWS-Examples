## Create a user with no permission and generate access key
```sh
aws iam create-user --user-name sts-machine-user
aws iam create-access-key --user-name sts-machine-user --output table
aws configure
aws sts get-caller-identity
```

## Create a role via CloudFormation
```sh
chmod u+x bin/deploy
./bin/deploy
```

## Use new user credentials and assume role
```sh
aws iam put-user-policy \
--user-name sts-machine-user \
--policy-name StsAssumePolicy \
--policy-document file://policy.json
```

```sh
aws sts assume-role \
--role-arn arn:aws:iam::597088034103:role/sts-example-stack-StsRole-CGBt4hkHfwZM \
--role-session-name s3-sts1 \
--profile sts
```

```sh
aws sts get-caller-identity --profile assumed
```

## Cleanup
Tear down CloudFormation stack via Management Console

```sh
aws iam delete-user-policy --user-name sts-machine-user --policy-name StsAssumePolicy
aws iam delete-access-key --access-key-id AKIAYWBJYLU3QMKBNWNB --user-name sts-machine-user
aws iam delete-user --user-name sts-machine-user
```
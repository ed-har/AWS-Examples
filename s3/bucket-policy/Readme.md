## Create a bucket
```sh
aws s3api create-bucket --bucket bucket-policy-example-ab2342 --create-bucket-configuration LocationConstraint=ap-northeast-1 
```

## Set bucket policy
```sh
aws s3api put-bucket-policy \
--bucket bucket-policy-example-ab2342 \
--policy file:///home/aero/study/AWS-Examples/s3/bucket-policy/policy.json
```

## Access bucket via other account
```sh
aws s3 ls s3://bucket-policy-example-ab2342
```

## Cleanup
```sh
aws s3 rm s3://bucket-policy-example-ab2342/test.txt
aws s3 rb s3://bucket-policy-example-ab2342
```
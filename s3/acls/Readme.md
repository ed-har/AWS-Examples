## Create a bucket
```sh
aws s3api create-bucket --bucket acl-example-ab2342 --create-bucket-configuration LocationConstraint=ap-northeast-1 
```

## Turn off block public access setting
```sh
aws s3api put-public-access-block \
--bucket acl-example-ab2342 \
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

## Change Bucket Ownership
```sh
aws s3api put-bucket-ownership-controls \
--bucket acl-example-ab2342 \
--ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

## Change ACLs to allow other AWS account
```sh
aws s3api put-bucket-acl \
--bucket acl-example-ab2342 \
--access-control-policy file:///home/aero/study/AWS-Examples/s3/acls/policy.json
```

## Access bucket from other account
```sh
touch hello.txt
aws s3 cp hello.txt s3://acl-example-ab2342
aws s3 ls s3://acl-example-ab2342
```

## Cleanup
```sh
aws s3 rm s3://acl-example-ab2342/hello.txt
aws s3 rb s3://acl-example-ab2342
```
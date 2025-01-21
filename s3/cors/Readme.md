# Create Website 1 

## Create a bucket
```sh
aws s3 mb s3://cors-example-ab2342
```

## Change block public access
```sh
aws s3api put-public-access-block \
--bucket cors-example-ab2342 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-example-ab2342 --policy file:///home/aero/study/AWS-Examples/s3/cors/bucket-policy.json
```

## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket cors-example-ab2342 --website-configuration file:///home/aero/study/AWS-Examples/s3/cors/website.json
```

## Upload our index.html file and include a resource that would be cross-origin
```sh
aws s3 cp index.html s3://cors-example-ab2342
```

##  View the website on S3
http://cors-example-ab2342.s3-website-ap-northeast-1.amazonaws.com

# Create website 2

## Create a bucket
```sh
aws s3 mb s3://cors-example2-ab2342
```

## Change block public access
```sh
aws s3api put-public-access-block \
--bucket cors-example2-ab2342 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-example2-ab2342 --policy file:///home/aero/study/AWS-Examples/s3/cors/bucket-policy2.json
```

## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket cors-example2-ab2342 --website-configuration file:///home/aero/study/AWS-Examples/s3/cors/website.json
```

## Upload our javascript file 
```sh
aws s3 cp hello.js s3://cors-example2-ab2342
```

## Create API Gateway with mock response and then test the endpoint
curl -X POST -H "Content-Type: application/json" https://u7t9owdfnb.execute-api.ap-northeast-1.amazonaws.com/prod/hello


##  View the website on S3
http://cors-example2-ab2342.s3-website-ap-northeast-1.amazonaws.com


## Apply a CORS policy
```sh
aws s3api put-bucket-cors --bucket cors-example-ab2342 --cors-configuration file://cors.json
```
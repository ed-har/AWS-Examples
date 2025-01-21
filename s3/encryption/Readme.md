## Create a bucket
```sh
aws s3 mb s3://encryption-example-ab2342
```

## Create a new text file with SSE-S3
```sh
echo "Hello Mars" > hello.txt
aws s3 cp hello.txt s3://encryption-example-ab2342
```

## Put Object with encryption of SSE-KMS
```sh
aws s3api put-object \
--bucket s3://encryption-example-ab2342 \
--key hello.txt \
--body hello.txt \
--server-side-encryption aws:kms \
# KMS keys are generated from bucket creation by default encryption to KMS and choosing from existing KMS key ("creating key" means CCK which cost money)
--sse-kms-key-id 'KMS KEY HERE' 
```

## Put Object with encryption of SSE-C [Failed]
```sh
# export BASE64_ENCODED_KEY=$(openssl rand 32 | base64)
export BASE64_ENCODED_KEY=$(openssl rand -base64 32)

export MD5_VALUE =(echo -n $BASE64_ENCODED_KEY | base64 --decode | md5sum | awk '{print $1}' | base64)

aws s3api put-object \
--bucket s3://encryption-example-ab2342 \
--key hello.txt \
--body hello.txt \
--sse-customer-algorithm  AES256 \
--sse-customer-key $ENCODED_KEY \
--sse-customer-key-md5 $MD5_VALUE
```

## Put Object with encryption of SSE-C [Success]
```sh
openssl rand -out ssec.key 32

# Upload
aws s3 cp hello.txt s3://encryption-example-ab2342/hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key

# Download
aws s3 s3://encryption-example-ab2342/hello.txt hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key
```
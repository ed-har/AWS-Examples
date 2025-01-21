## Create a bucket
```sh
aws s3 mb s3://metadata-example-ab2342
```

## Create a new text file
```sh
echo "Hello Mars" > hello.txt
```

## Put object with metadata
```sh
aws s3api put-object --bucket metadata-example-ab2342 --key hello2.txt --metadata Planet=Mars --body hello.txt
```

## Get metadata through head object
```sh
aws s3api head-object --bucket metadata-example-ab2342 --key hello2.txt
```
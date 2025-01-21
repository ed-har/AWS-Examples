## Create a bucket
```sh
aws s3 mb s3://prefixes-example-ab2342
```

## Create a folder
```sh
aws s3api put-object --bucket="prefixes-example-ab2342" --key="hello/"
```
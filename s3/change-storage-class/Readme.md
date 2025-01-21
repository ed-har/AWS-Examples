## Create a bucket
```sh
aws s3 mb s3://class-example-ab2342
```

## Create a file
```sh
echo "Hello World" > hello.txt
aws s3 cp hello.txt s3://class-example-ab2342 --storage-class STANDARD_IA
```

## Cleanup
```sh
aws s3 rm s3://class-example-ab2342/hello.txt
aws s3 rb s3://class-example-ab2342
```
## Create a new s3 bucket

```md
aws s3 mb s3://checksums-example-ab-2342
```

## Create a file to do checksum on

```
echo "Hello Mars" > myfile.txt
```

## Get checksum md5 of file
md5sum myfile.txt
8ed2d86f12620cdba4c976ff6651637f

## Upload file to S3
aws s3 cp myfile.txt s3://checksums-example-ab-2342
aws s3api head-object --bucket checksums-example-ab-2342 --key myfile.txt

## Upload file with different checksum
```sh
sudo apt install rhash -y
rhash --crc32 --simple *.txt
e7c80b87
```

```sh
aws s3api put-object \
--bucket checksums-example-ab-2342 \
--key myfilesha1.txt \
--body myfile.txt \
--checksum-algorithm="crc32" \
--checksum-crc32="e7c80b87"
```

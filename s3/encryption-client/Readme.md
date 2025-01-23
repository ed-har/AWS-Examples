## Create a bucket
```sh
aws s3 mb s3://encryption-client-example-ab2342
```

## Create a new text file (don't actually need to do this) 
```sh
echo "Hello Mars" > hello.txt
aws s3 cp hello.txt s3://encryption-client-example-ab2342
```

## Run our ruby encrypt script
export BUNDLE_PATH=~/.gems
bundle exec ruby encrypt.rb

## Cleanup
aws s3 rm s3://encryption-client-example-ab2342/hello.txt
aws s3 rb s3://encryption-client-example-ab2342
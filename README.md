
# Using MDS for EC2 Instance set with IMDSv2
```sh
aws ec2 modify-instance-metadata-options \
--instance-id  i-01e5d979c01d87f55 \
--http-tokens required \
--region ap-northeast-1
```
     
```sh
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
	&& curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/
```

# Connecting to a EC2 instance via SSH
```sh
ssh-keygen -t rsa -f ec2connect
```

```sh
aws ec2-instance-connect send-ssh-public-key \
--instance-id i-0b02a825f3635bb96 \
--instance-os-user ec2-user \
--availability-zone ap-northeast-1c \
--ssh-public-key file://ec2connect.pub

ssh -i ec2connect ec2-user@52.68.155.213
```
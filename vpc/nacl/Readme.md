# Create a NACL
```sh
aws ec2 create-network-acl --vpc-id vpc-01c5786ddd7d44770
```
# Get AMI for Linux 2 
```sh
aws ec2 describe-images \
--owners amazon \
--filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" \
--region ap-northeast-1 \
--query 'Images[0].ImageId' \
--output text
```

## Add a rule block a IP
https://whatismyipaddress.com/ip/59.132.62.30

```sh
aws ec2 create-network-acl-entry \
--network-acl-id acl-038819cf90c1507ee \
--ingress \
--rule-number 90 \
--protocol "-1" \
--port-range From=0,To=65535 \
--cidr-block 59.132.62.30/32 \
--rule-action "deny" 
```
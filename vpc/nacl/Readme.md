# Create NACL

```sh
# https://docs.aws.amazon.com/cli/latest/reference/ec2/create-network-acl.html
aws ec2 create-network-acl \
  --vpc-id vpc-06fa13514fdd25732
```

# Get AMI ID of Amazon Linux 2 for ap-south-1

```sh
aws ec2 describe-images \
    --region ap-south-1 \
    --owners amazon \
    --filters "Name=name,Values=amzn2-ami-hvm-2.*-x86_64-gp2" "Name=state,Values=available" \
    --query 'Images | sort_by(@, &CreationDate)[-1].ImageId' \
    --output text

```

# Block specific IP

```sh
# https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ec2/create-network-acl-entry.html
aws ec2 create-network-acl-entry \
    --network-acl-id "acl-0279204037ebbda46" \
    --ingress \
    --rule-number 90 \
    --protocol -1 \
    --port-range From=0,To=65535 \
    --cidr-block 106.219.154.210/32 \
    --rule-action deny
```

# Remove the deny rule

```sh
# https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ec2/delete-network-acl-entry.html
aws ec2 delete-network-acl-entry \
  --network-acl-id "acl-0279204037ebbda46" \
  --ingress \
  --rule-number 90
```

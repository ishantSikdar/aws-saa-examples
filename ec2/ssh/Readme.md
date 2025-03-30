# Create SSH key

```sh
# https://www.ssh.com/academy/ssh/keygen
ssh-keygen -t rsa -b 4096

```

# Send public key to instance

```sh
# https://docs.aws.amazon.com/cli/latest/reference/ec2-instance-connect/send-ssh-public-key.html
aws ec2-instance-connect send-ssh-public-key \
    --instance-id i-1234567890abcdef0 \
    --instance-os-user ec2-user \
    --availability-zone ap-south-1 \
    --ssh-public-key file://id_rsa.pub

```

# Connect to EC2

```sh
ssh -i "id_rsa" ec2-user@214.12.214.23

```

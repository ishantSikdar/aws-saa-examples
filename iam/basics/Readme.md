## Create IAM Policy

```sh
# https://awscli.amazonaws.com/v2/documentation/api/latest/reference/iam/create-policy.html
aws iam create-policy \
  --policy-name my-fun-policcyy \
  --policy-document file://policy.json

```

## Attach policy to user

```sh
# https://awscli.amazonaws.com/v2/documentation/api/latest/reference/iam/attach-user-policy.html
aws iam attach-user-policy \
    --policy-arn arn:aws:iam::675246323040:policy/my-fun-policcyy \
    --user-name aws-examples
```

### delete policy version

```sh
# https://awscli.amazonaws.com/v2/documentation/api/latest/reference/iam/delete-policy-version.html
aws iam delete-policy-version \
    --policy-arn arn:aws:iam::675246323040:policy/my-fun-policcyy \
    --version-id v1
```

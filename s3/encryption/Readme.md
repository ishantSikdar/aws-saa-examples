## Create a bucket

```sh
  aws s3 mb s3://demo-sse-bucket-is-7431
```

## Create a file

```sh
  echo "This is my hello world - sse" > hello.txt
```

## Put an object

```sh
  aws s3 cp hello.txt s3://demo-sse-bucket-is-7431
```

https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3api/put-object.html

## Put Object using encryption SSE-KMS

```sh

  aws s3api put-object \
    --bucket demo-sse-bucket-is-7431 \
    --key hello.txt \
    --body hello.txt \
    --server-side-encryption aws:kms \
    --ssekms-key-id AWS_MANGAGED_S3_KEY

```

## Put object using encryption SSE-C

https://catalog.us-east-1.prod.workshops.aws/workshops/aad9ff1e-b607-45bc-893f-121ea5224f24/en-US/s3/serverside/ssec

### Generate a key

```sh

  openssl rand -out ssec.key 32

```

### put object

```sh

  aws s3 cp hello.txt s3://demo-sse-bucket-is-7431 \
    --sse-c AES256 \
    --sse-c-key fileb://ssec.key

```

### decrypt and download

```sh

  aws s3 cp s3://demo-sse-bucket-is-7431/hello.txt hello-decrypted.txt \
    --sse-c AES256 \
    --sse-c-key fileb://ssec.key

```

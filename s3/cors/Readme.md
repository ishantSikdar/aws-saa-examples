### Create a bucket

```sh
  # https://docs.aws.amazon.com/cli/latest/reference/s3/mb.html
  aws s3 mb s3://my-example-bucket-ish-2342
```

### Block public access

```sh
  # https://docs.aws.amazon.com/cli/latest/reference/s3api/put-public-access-block.html
  aws s3api put-public-access-block \
    --bucket my-example-bucket-ish-2342 \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

### Attach bucket policy

```sh
  # https://docs.aws.amazon.com/cli/latest/reference/s3api/put-bucket-policy.html
  aws s3api put-bucket-policy --bucket my-example-bucket-ish-2342 --policy file://bucket-policy.json
```

### Enable static website hosting

```sh
  # https://docs.aws.amazon.com/cli/latest/reference/s3api/put-bucket-website.html
  aws s3api put-bucket-website --bucket my-example-bucket-ish-2342 --website-configuration file://website-config.json
```

### Upload an index.html to bucket

```sh
  # https://docs.aws.amazon.com/cli/latest/reference/s3/cp.html
  aws s3 cp index.html s3://my-example-bucket-ish-2342
```

### Try and get website endpoint url:

`http://my-example-bucket-ish-2342.s3-website.ap-south-1.amazonaws.com`

### Create an api endpoint on API gateway

```sh
curl --location --request POST 'https://bke3pfb8p6.execute-api.ap-south-1.amazonaws.com/prod/hello'
```

### Re-upload index.html with API call

```sh
  # https://docs.aws.amazon.com/cli/latest/reference/s3/cp.html
  aws s3 cp index.html s3://my-example-bucket-ish-2342
```

### Face cors error

`Access to fetch at 'https://bke3pfb8p6.execute-api.ap-south-1.amazonaws.com/prod/hello' from origin 'http://127.0.0.1:5500' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource. If an opaque response serves your needs, set the request's mode to 'no-cors' to fetch the resource with CORS disabled.`

### Enable cors on api gateway and redeploy

### Add a cors policy to bucket

```sh
  # https://docs.aws.amazon.com/cli/latest/reference/s3api/put-bucket-cors.html
  aws s3api put-bucket-cors --bucket my-example-bucket-ish-2342 --cors-configuration file://cors-config.json
```

### Once successfull, tear down bucket and API

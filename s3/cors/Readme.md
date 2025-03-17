### create a bucket

aws s3 mb s3://my-example-bucket-ish-2342

### block public access

```sh
  aws s3api put-public-access-block \
    --bucket my-example-bucket-ish-2342 \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

### attach bucket policy

```sh
  aws s3api put-bucket-policy --bucket my-example-bucket-ish-2342 --policy file://bucket-policy.json
```

### enable static website hosting

```sh
  aws s3api put-bucket-website --bucket my-example-bucket-ish-2342 --website-configuration file://website-config.json
```

### upload an index.html to bucket

```sh
  aws s3 cp index.html s3://my-example-bucket-ish-2342
```

### try and get website endpoint url:

`http://my-example-bucket-ish-2342.s3-website.ap-south-1.amazonaws.com`

### create an api endpoint on API gateway

```sh
curl --location --request POST 'https://bke3pfb8p6.execute-api.ap-south-1.amazonaws.com/prod/hello'
```

### re upload index.html with API call

```sh
  aws s3 cp index.html s3://my-example-bucket-ish-2342
```

### face cors error

`Access to fetch at 'https://bke3pfb8p6.execute-api.ap-south-1.amazonaws.com/prod/hello' from origin 'http://127.0.0.1:5500' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource. If an opaque response serves your needs, set the request's mode to 'no-cors' to fetch the resource with CORS disabled.`

### enable cors on api gateway and redeploy

### add a cors policy to bucket

```sh
  aws s3api put-bucket-cors --bucket my-example-bucket-ish-2342 --cors-configuration file://cors-config.json
```

### once successfull, tear down bucket and api

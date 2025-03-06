import { Stack, StackProps } from "aws-cdk-lib";
import * as s3 from "aws-cdk-lib/aws-s3";
import { Construct } from "constructs";

export class CdkStack extends Stack {
  constructor(scope: Construct, id: string, props?: StackProps) {
    super(scope, id, props);
    new s3.Bucket(this, "MyBucket", {
      // THE FOLLOWING ARE OPTIONAL
      // bucketName: "my-random-bucket",
      // blockPublicAccess: s3.BlockPublicAccess.BLOCK_ALL,
      // encryption: s3.BucketEncryption.S3_MANAGED,
      // enforceSSL: true,
      // versioned: false,
    });
  }
}

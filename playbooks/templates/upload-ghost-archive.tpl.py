#!/usr/bin/env python3

import sys
import boto3

SOURCE_FILE_NAME = "ghost.tar.gz"
BUCKET_NAME = "{{local_aws_s3_bucket_name}}"
TARGET_FILE_NAME = "var/www/" + SOURCE_FILE_NAME

client = boto3.client('s3')
if not client:
    sys.exit(1)

with open(SOURCE_FILE_NAME, "rb") as source_file:
    response = client.put_object(
            Body = source_file,
            Bucket = BUCKET_NAME,
            Key = TARGET_FILE_NAME
    )
    if not response or not response['ETag']:
        sys.exit(2)

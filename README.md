# cocoapods-s3

This Cocoapods plugin allows you to use dependencies from a bucket in AWS S3.

## Installation

    $ gem install cocoapods-s3

## Usage

First at all, you must set your AWS S3 credentials in your Podfile:

    set_aws_credentials :region => region, :access_key => access_key, :secret_key => secret_key

### Podfile

Then, add your Pods using a S3 URL using the `:podspec` parameter:

    pod <pod_name>, :podspec => "s3://bucket_name/path/to/pod_name.podspec"

### Podspec

You can use a S3 URL on your Podspecs too.

Just put the S3 URL in the `:http` parameter in the `source` property of the spec: 

    s.source = { :http => 's3://bucket_name/path/to/artifacts.zip', :sha256 => 'e57f2ed9fb84633bc0cd4ed930bb9d770039ddbdac1b31910d6f4307cfba6b26' }

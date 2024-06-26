require 'cocoapods-s3/downloader'
require 'cocoapods-s3/external_sources/podspec_source'

def set_aws_credentials(access_key:, secret_key:, region: 'us-east-1')
  Pod::Downloader::S3.set_credentials access_key, secret_key, :region => region
end

def get_s3_object(url:, target: nil)
  Pod::Downloader::S3.get_object :url => url, :target => target
end

def list_s3_objects(url:)
  Pod::Downloader::S3.list_objects :url => url
end

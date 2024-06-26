require 'aws-sdk-s3'

module Pod
  module Downloader
    class S3
      @_access_key = nil
      @_secret_key = nil
      @_region = nil
      @_client = nil

      def self.set_credentials(access_key, secret_key, region: 'us-east-1')
        @_access_key = access_key
        @_secret_key = secret_key
        @_region = region || 'us-east-1'

        # Reset the client so it will be recreated with the new credentials
        # the next time that it is used.
        @_client = nil
      end

      def self.get_client
        @_client ||= Aws::S3::Client.new(
          region: @_region,
          access_key_id: @_access_key,
          secret_access_key: @_secret_key,
        )
      end

      def self.sign_url(url)
        bucket, key = _slice_url(url)

        Aws::S3::Presigner.new(client: get_client).presigned_url(
          :get_object, bucket: bucket, key: key, expires_in: 120
        )
      end

      def self.list_objects(url: nil, bucket: nil, key: nil)
        bucket, key = _get_bucket_and_key(url, bucket, key)

        unless key.end_with? '/'
          key = "#{key}/"
        end

        get_client.list_objects_v2({
          bucket: bucket,
          prefix: key,
          delimiter: "/",
        })
      end

      def self.get_object(target: nil, url: nil, bucket: nil, key: nil)
        bucket, key = _get_bucket_and_key(url, bucket, key)

        response = get_client.get_object({
          response_target: target,
          bucket: bucket,
          key: key,
        })

        if target.nil?
          return response.body.string
        end
      end

      def self._get_bucket_and_key(url, bucket, key)
        unless url.nil?
          return _slice_url(url)
        end

        return bucket, key
      end

      def self._slice_url(url)
        # Remove s3:// substring and split by /
        parts = url[5..-1].split('/')

        [
          # bucket: The first element in the url is the bucket.
          parts[0],

          # key: The rest of components in the url are the key of the object to download.
          parts[1..-1].join('/')
        ]
      end
    end
  end
end

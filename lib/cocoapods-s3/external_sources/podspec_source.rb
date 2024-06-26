require 'cocoapods-s3/s3'

module Pod
  module ExternalSources
    class PodspecSource < AbstractExternalSource
      alias parent_podspec_uri podspec_uri

      def podspec_uri
        uri = parent_podspec_uri

        if uri.start_with?('s3')
          uri = podspec_uri_for_s3(uri)
        end

        uri
      end

      def podspec_uri_for_s3(uri)
        unless uri.end_with?('.podspec')
          uri = "#{uri}/#{name}.podspec"
        end

        Pod::Downloader::S3.sign_url(uri)
      end
    end
  end
end

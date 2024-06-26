require 'cocoapods-s3/s3'

module Pod
  module Downloader
    class <<self
      alias_method :real_download_source, :download_source
    end

    def self.download_source(target, params)
      source = params[:http]

      if !source.nil? and source.start_with?('s3')
        params[:http] = Pod::Downloader::S3.sign_url(source)
      end

      self.real_download_source(target, params)
    end
  end
end
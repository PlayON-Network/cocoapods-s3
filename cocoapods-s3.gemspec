# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-s3/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-s3'
  spec.version       = CocoapodsS3::VERSION
  spec.authors       = ['PlayON Network Team']
  spec.email         = ['devs@playon.network']
  spec.description   = %q{This Cocoapods plugin allows you to use dependencies from a bucket in AWS S3.}
  spec.summary       = %q{This Cocoapods plugin allows you to use dependencies from a bucket in AWS S3.}
  spec.homepage      = 'https://playon.network'
  spec.license       = 'Apache-2.0'

  spec.files         = Dir['lib/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'aws-sdk-s3', '~> 1'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 1'

  spec.metadata = {
    "documentation_uri" => "https://github.com/PlayON-Network/cocoapods-s3",
    "homepage_uri"      => "https://playon.network",
    "source_code_uri"   => "https://github.com/PlayON-Network/cocoapods-s3",
  }
end

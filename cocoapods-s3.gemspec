# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-s3/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-s3'
  spec.version       = CocoapodsS3::VERSION
  spec.authors       = ['David Arias Vázquez']
  spec.email         = ['dav.surf@gmail.com']
  spec.description   = %q{A short description of cocoapods-s3.}
  spec.summary       = %q{A longer description of cocoapods-s3.}
  spec.homepage      = 'https://github.com/EXAMPLE/cocoapods-s3'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end

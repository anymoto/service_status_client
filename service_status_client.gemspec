# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'service_status_client/version'

Gem::Specification.new do |spec|
  spec.name          = "service_status_client"
  spec.version       = ServiceStatusClient::VERSION
  spec.authors       = ["Ana Castro"]
  spec.email         = ["ana@castromartinez.com"]

  spec.summary       = %q{Library to consume the Service Status API}
  spec.homepage      = "https://github.com/anymoto/service_status_client"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_runtime_dependency     'activeresource'
end

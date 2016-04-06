# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitbucket2/version'

Gem::Specification.new do |spec|
  spec.name          = "bitbucket2"
  spec.version       = Bitbucket2::VERSION
  spec.authors       = ["Simon Hildebrandt"]
  spec.email         = ["simon.hildebrandt@fairfaxmedia.com.au"]

  spec.summary       = %q{A simple wrapper gem around Bitbucket's 2.0 API.}
  spec.description   = %q{A simple wrapper gem around Bitbucket's 2.0 API.}
  spec.homepage      = "https://github.com/fairfaxmedia/bitbucket2"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "restroom"
  spec.add_runtime_dependency 'virtus'
  spec.add_runtime_dependency 'oauth2'
  spec.add_runtime_dependency 'activemodel'
  spec.add_runtime_dependency 'faraday_middleware'
  spec.add_runtime_dependency 'faraday-http-cache'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "webmock"
end

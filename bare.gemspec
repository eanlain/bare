# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bare/version'

Gem::Specification.new do |spec|
  spec.name          = "bare"
  spec.version       = Bare::VERSION
  spec.authors       = ["Brandon Robins"]
  spec.email         = ["brandon@ourlabel.com"]
  spec.summary       = "Barebones RESTful requests for Ruby."
  spec.description   = "Barebones RESTful requests for Ruby."
  spec.homepage      = "http://www.github.com/eanlain/bare"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end

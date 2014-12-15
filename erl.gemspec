# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'erl/version'

Gem::Specification.new do |spec|
  spec.name          = "erl"
  spec.version       = Erl::VERSION
  spec.authors       = ["Yuichi Takada"]
  spec.email         = ["takadyuichi@gmail.com"]
  spec.summary       = "executable readline wrapper"
  spec.description   = "erl is not only GNU readline wrapper. erl enable you to execute multiple queries from one console."
  spec.homepage      = "https://github.com/takady/erl"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'servatron/version'

Gem::Specification.new do |spec|
  spec.name          = "servatron"
  spec.version       = Servatron::VERSION
  spec.authors       = ["Jared Grippe"]
  spec.email         = ["jared@deadlyicon.com"]
  spec.description   = %q{Write a gem description}
  spec.summary       = %q{Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'shotgun'
  spec.add_runtime_dependency 'slop'
  spec.add_runtime_dependency 'pry'
  spec.add_runtime_dependency 'pry-debugger'
  spec.add_runtime_dependency 'tilt'
  spec.add_runtime_dependency 'haml'
  spec.add_runtime_dependency 'sass'
  spec.add_runtime_dependency 'builder'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chsource/version'

Gem::Specification.new do |spec|
  spec.name          = "chsource"
  spec.version       = Chsource::VERSION
  spec.authors       = ["Hao Wei"]
  spec.email         = ["imwillmouse@gmail.com"]
  spec.description   = %q{chsource make you change Gemfile's source quickly}
  spec.summary       = %q{change Gemfile's source to 3rd party quickly}
  spec.homepage      = "http://github.com/weih/chsource"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.0.0"
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'coveralls'
end

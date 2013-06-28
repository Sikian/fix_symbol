# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fix_symbol/version'

Gem::Specification.new do |spec|
  spec.name          = "fix_symbol"
  spec.version       = FixSymbol::VERSION
  spec.authors       = ["Sikian"]
  spec.email         = ["sikian@gmail.com"]
  spec.description   = %q{A simple gem to allow symbols with fix id throughout different instances.}
  spec.summary       = %q{A simple gem to allow symbols with fix id throughout different instances.}
  spec.homepage      = ""
  spec.license       = "GPL-3.0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

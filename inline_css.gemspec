# coding: utf-8
$:.unshift __dir__ + '/lib'
require 'inline_css'

Gem::Specification.new do |spec|
  spec.name          = "inline_css"
  spec.version       = '0.1.0'
  spec.authors       = ["Roman Le Négrate"]
  spec.email         = ["roman.lenegrate@gmail.com"]
  spec.summary       = "Inlines CSS into HTML"
  spec.homepage      = "https://github.com/Roman2K/inline_css"
  spec.license       = "Unlicense"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^test/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'nokogiri', '~> 1.6.1'
  spec.add_runtime_dependency 'crass', '~> 0.2.0'
end

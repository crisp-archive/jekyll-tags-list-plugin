# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-tagslist/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-tagslist"
  spec.version       = Jekyll::Tagslist::VERSION
  spec.authors       = ["David Zhang"]
  spec.email         = ["crispgm@gmail.com"]
  spec.summary       = "A Liquid tag plugin for Jekyll."
  spec.homepage      = "https://github.com/crispgm/jekyll-tags-list-plugin"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 1.9.3'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  # spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "jekyll", ">= 2.0"
end

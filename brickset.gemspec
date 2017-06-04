# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brickset/version'

Gem::Specification.new do |spec|
  spec.name          = "brickset"
  spec.version       = Brickset::VERSION
  spec.authors       = ["Pedro Freitas"]
  spec.email         = ["dryginlogic@gmail.com"]
  spec.date          = ["2013-01-01"]
  spec.summary       = %q{Get LEGO set details from brickset.com.}
  spec.homepage      = "http://github.com/pelf/brickset"
  spec.license       = "MIT"
  spec.files         = Dir['{lib,spec}/**/*', 'Rakefile', 'README.md']

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.add_dependency "nokogiri", "~> 1.7"
  spec.add_dependency "activesupport", "~> 4.0"
  spec.add_dependency "virtus", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 2.3"
  spec.add_development_dependency "vcr", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0"
end

# frozen_string_literal: true

require File.expand_path("../lib/b3bm/version", __FILE__)

Gem::Specification.new do |spec|
  spec.name = "b3bm"
  spec.version = B3bm::VERSION
  spec.summary = "Base62 for Ruby."
  spec.description = spec.summary

  spec.author = "Bryan Powell"
  spec.email = "bryan@bryanp.org"
  spec.homepage = "https://github.com/bryanp/b3bm/"

  spec.required_ruby_version = ">= 2.6.7"

  spec.license = "MPL-2.0"

  spec.files = Dir["CHANGELOG.md", "README.md", "LICENSE", "lib/**/*"]
  spec.require_path = "lib"
end

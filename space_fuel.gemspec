# frozen_string_literal: true

require_relative 'lib/space_fuel/version'

Gem::Specification.new do |spec|
  spec.require_paths = %w[lib]
  spec.files = `git ls-files lib LICENSE`.split("\n")

  spec.name = 'space_fuel'
  spec.version = SpaceFuel::VERSION
  spec.authors = ['Тимур Каримов']
  spec.email = ['mathcoredetected@gmail.com']

  spec.summary = 'Gem for calculating fuel required for space flights'
  spec.description = 'This gem provides a simple and reliable way to calculate the fuel required for space flights based on the flight route and ship mass.'
  spec.required_ruby_version = '>= 2.6.0'

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rspec'
end

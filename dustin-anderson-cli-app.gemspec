# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative './lib/app/version'

Gem::Specification.new do |spec|
  spec.name          = 'dustin-anderson-cli-app'
  spec.version       = DustinAndersonCLIApp::VERSION
  spec.authors       = 'Dustin Anderson'
  spec.email         = 'dandersonsoftware@out0look.com'

  spec.summary       = 'Provides information about Rotten Tomatoes top 100 movies.'
  spec.homepage      = 'https://github.com/TheDreamingTree145/dustin-anderson-cli-app'
  spec.license       = 'MIT'


  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'pry', '~> 0.10.3'
  spec.add_development_dependency 'nokogiri', '~> 1.6', '>= 1.6.8'
end

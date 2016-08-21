# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tesco_rb/version'

Gem::Specification.new do |spec|
  spec.name          = 'tesco_rb'
  spec.version       = TescoRb::VERSION
  spec.authors       = ['William Clarke']
  spec.email         = ['wmmclarke@gmail.com']

  spec.summary       = 'A wrapper to the Tesco API'
  spec.description   = 'Navigate the Tesco API: https://devportal.tescolabs.com/docs/services/'

  spec.homepage      = 'https://github.com/wmmc/tesco_rb'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    fail 'RubyGems 2.0 or newer is required'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'httparty', '~> 0.14.0'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'pry-byebug', '~> 3.4', '>= 3.4.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'vcr', '~> 3.0', '>= 3.0.3'
  spec.add_development_dependency 'webmock', '~> 2.1', '>= 2.1.0'
  spec.add_development_dependency 'dotenv', '~> 2.1', '>= 2.1.1'
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant/ssh/version'

Gem::Specification.new do |spec|
  spec.name          = 'vagrant-ssh'
  spec.version       = Vagrant::SSH::VERSION
  spec.authors       = ['Ben Snape']
  spec.email         = ['bsnape@gmail.com']
  spec.description   = %q{An easy way to execute SSH commands on your Vagrant image.}
  spec.summary       = %q{An easy way to execute SSH commands on your Vagrant image.}
  spec.homepage      = 'http://www.bensnape.com'
  spec.license       = 'GNU'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'net-ssh'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end

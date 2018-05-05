# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'picrate/version'

Gem::Specification.new do |gem|
  gem.name          = 'picrate'
  gem.version       = PiCrate::VERSION
  gem.authors       = ['monkstone']
  gem.email         = ['mamba2928@yahoo.co.uk']
  gem.licenses     = %w(GPL-3.0 LGPL-2.0)
  gem.description  = <<-EOS
  A batteries included version of processing in ruby, for raspberrypi and linux.
  EOS
  gem.summary       = %q{ruby wrapper for processing-3.3.7 on raspberrypi and linux64}
  gem.homepage      = 'https://ruby-processing.github.io/PiCrate/'
  gem.files         = `git ls-files`.split($/)
  gem.files << 'lib/picrate-0.0.1.jar'
  gem.files << 'lib/gluegen-rt-2.3.2.jar'
  gem.files << 'lib/jogl-all-2.3.2.jar'
  gem.files << 'lib/gluegen-rt-2.3.2-natives-linux-amd64.jar'
  gem.files << 'lib/gluegen-rt-2.3.2-natives-armv6hf.jar'
  gem.files << 'lib/jogl-all-2.3.2-natives-linux-amd64.jar'
  gem.files << 'lib/jogl-all-2.3.2-natives-linux-armv6hf.jar'
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.add_development_dependency 'rake', '~> 12.3'
  gem.add_development_dependency 'minitest', '~> 5.10'
  gem.add_runtime_dependency 'arcball', '~> 1.0', '>= 1.0.0'
  gem.require_paths = ['lib']
  gem.platform      = 'java'
  gem.requirements << 'java runtime >= 1.8.0_151+'
end

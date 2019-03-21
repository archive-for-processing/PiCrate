# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'picrate/version'

Gem::Specification.new do |gem|
  gem.name        = 'picrate'
  gem.version     = PiCrate::VERSION
  gem.authors     = ['monkstone']
  gem.email       = ['mamba2928@yahoo.co.uk']
  gem.licenses    = %w(GPL-3.0 LGPL-2.0)
  gem.description = <<~EOS
    A batteries included version of processing in ruby, for raspberrypi and
    linux. Install samples to configures geany ide.
  EOS
  gem.summary     = %q{ruby wrapper for processing-3.5.3 on raspberrypi and linux64}
  gem.homepage    = 'https://ruby-processing.github.io/PiCrate/'
  gem.post_install_message = %q{Use 'picrate --install Samples' to install samples}
  gem.files       = `git ls-files`.split($/)
  gem.files << "lib/picrate-#{PiCrate::VERSION}.jar"
  gem.files << 'lib/gluegen-rt.jar'
  gem.files << 'lib/jogl-all.jar'
  gem.files << 'lib/gluegen-rt-natives-linux-amd64.jar'
  gem.files << 'lib/gluegen-rt-natives-linux-armv6hf.jar'
  # gem.files << 'lib/gluegen-rt-natives-linux-aarch64.jar'
  gem.files << 'lib/jogl-all-natives-linux-amd64.jar'
  gem.files << 'lib/jogl-all-natives-linux-armv6hf.jar'
  # gem.files << 'lib/jogl-all-natives-linux-aarch64.jar'
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.add_development_dependency 'rake', '~> 12.3'
  gem.add_development_dependency 'minitest', '~> 5.10'
  gem.add_runtime_dependency 'arcball', '~> 1.0', '>= 1.0.0'
  gem.require_paths = ['lib']
  gem.platform      = 'java'
  gem.requirements << 'java runtime >= 1.8.0_161+'
end

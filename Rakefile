# frozen_string_literal: false
require_relative 'lib/picrate/version'

def create_manifest
  title = 'Implementation-Title: PiCrate'
  version = format('Implementation-Version: %s', PiCrate::VERSION)
  File.open('MANIFEST.MF', 'w') do |f|
    f.puts(title)
    f.puts(version)
    f.puts('Class-Path: gluegen-rt.jar jog-all.jar')
  end
end

task default: [:init, :compile, :install, :test, :gem]

# depends on installed processing, with processing on path
desc 'Create Manifest and Copy Jars'
task :init do
  create_manifest
  fprocessing_root = File.dirname(`readlink -f $(which processing)`)
  # processing_root = '/home/tux/processing-3.4'
  jar_dir = File.join(processing_root, 'core', 'library')
  opengl = Dir.entries(jar_dir).grep(/amd64|armv6hf/).select { |jar| jar =~ /linux/ }
  opengl.concat %w[jogl-all.jar gluegen-rt.jar]
  opengl.each do |gl|
    FileUtils.cp(File.join(jar_dir, gl), File.join('.', 'lib'))
  end
end

desc 'Install'
task :install do
  sh 'mv target/picrate-0.4.1.jar lib'
end

desc 'Gem'
task :gem do
  sh 'gem build picrate.gemspec'
end

desc 'Document'
task :javadoc do
  sh 'mvn javadoc:javadoc'
end

desc 'Compile'
task :compile do
  sh 'mvn package'
end

desc 'Test'
task :test do
  sh 'jruby test/helper_methods_test.rb'
  # sh 'jruby test/respond_to_test.rb' Skip test on Travis to avoid Headless fail
  sh 'jruby test/create_test.rb'
  sh 'jruby test/math_tool_test.rb'
  sh 'jruby test/deglut_spec_test.rb'
  sh 'jruby test/vecmath_spec_test.rb'
end

desc 'clean'
task :clean do
  Dir['./**/*.%w{jar gem}'].each do |path|
    puts 'Deleting #{path} ...'
    File.delete(path)
  end
  FileUtils.rm_rf('./target')
end

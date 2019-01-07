require_relative 'sketch_writer'

class SketchFactory
  NAMES = %w[One Two Three]
  def initialize(argc)
    NAMES.each do |name|
      SketchWriter.new(File.basename(name, '.rb')).write
    end
  end
end

SketchFactory.new(File.join(ENV['HOME'], 'test'))

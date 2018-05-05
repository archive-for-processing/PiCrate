require_relative 'test_helper'
require_relative '../lib/picrate/creators/sketch_class'
require_relative '../lib/picrate/creators/sketch_writer'

CLASS_SKETCH = <<~CODE

#!/usr/bin/env jruby
# frozen_string_literal: false
require 'picrate'

class FredSketch < Processing::App
  def settings
    size 200, 200
  end

  def setup
    sketch_title 'Fred Sketch'
  end

  def draw

  end
end

FredSketch.new

CODE

class SketchClassTest < Minitest::Test

  def setup
    @basic = SketchClass.new(name: 'fred_sketch', width: 200, height: 200)
    @sketch = SketchClass.new(name: 'fred_sketch', width: 200, height: 200, mode: 'p2d')
  end

  def test_class
    result = CLASS_SKETCH.split(/\n/, -1)
    class_lines = @sketch.lines
    class_lines.each_with_index do |line, i|
      assert_equal result[i], line
    end
  end

  def test_indent
    assert_equal '  indent', @sketch.indent('indent')
  end

  def test_size
    assert_equal '    size 200, 200, P2D', @sketch.size
    assert_equal '    size 200, 200', @basic.size
  end

  def test_sketch_title
    assert_equal "    sketch_title 'Fred Sketch'", @sketch.sketch_title
  end

  def test_class
    assert_equal "FredSketch", @sketch.sketch_class
  end

  def test_class_new
    assert_equal "FredSketch.new", @sketch.sketch_new
  end

  def test_sketch_class
    assert_equal "class FredSketch < Processing::App", @basic.class_sketch
  end
end

# frozen_string_literal: true

require_relative 'test_helper'

Java::Monkstone::PicrateLibrary.new.load(JRuby.runtime, false)

include Processing::HelperMethods
include MathTool

Dir.chdir(File.dirname(__FILE__))

class HelperMethodsTest < Minitest::Test
  ARRAY = %w[albatross dog horse].freeze
  def test_hex_color
    col_double = 0.5
    hexcolor = 0xFFCC6600
    dodgy_hexstring = '*56666'
    hexstring = '#CC6600'
    assert hex_color(col_double) == 0.5, 'double as a color'
    assert hex_color(hexcolor) == -3_381_760, 'hexadecimal fixnum color'
    assert hex_color(hexstring) == -3_381_760, 'hexadecimal string color'
    assert_raises(StandardError, 'Dodgy Hexstring') do
      hex_color(dodgy_hexstring)
    end
    assert_raises(StandardError, 'Dodgy Color Conversion') do
      hex_color([])
    end
   end

  def test_dist
    ax = 0
    ay = 0
    bx = 1.0
    by = 1.0
    assert_in_epsilon(dist(ax, ay, bx, by), Math.sqrt(2), epsilon = 0.0001, msg = '2D distance')
    by = 0.0
    assert_in_epsilon(dist(ax, ay, bx, by), 1.0, epsilon = 0.0001, msg = 'when y dimension is zero')
    ax = 0
    ay = 0
    bx = 0.0
    by = 0.0
    assert_in_epsilon(dist(ax, ay, bx, by), 0.0, epsilon = 0.0001, msg = 'when x and y dimension are zero')
    ax = 1
    ay = 1
    bx = -2.0
    by = -3.0
    assert_in_epsilon(dist(ax, ay, bx, by), 5.0, epsilon = 0.0001, msg = 'classic triangle dimensions')
    ax = -1
    ay = -1
    bx = 100
    by = 2.0
    cx = 3.0
    cy = 100
    assert_in_epsilon(dist(ax, ay, bx, by, cx, cy), 5.0, epsilon = 0.0001, msg = 'classic triangle dimensions')
    ax = 0
    ay = 0
    bx = -1.0
    by = -1.0
    cx = 0
    cy = 0
    assert_in_epsilon(dist(ax, ay, bx, by, cx, cy), Math.sqrt(2), epsilon = 0.0001, msg = '2D distance')
    ax = 0
    ay = 0
    bx = 0.0
    by = 0.0
    cx = 0
    cy = 0
    assert_in_epsilon(dist(ax, ay, bx, by, cx, cy), 0.0)
    ax = 0
    ay = 0
    bx = 1.0
    by = 0.0
    cx = 0
    cy = 0
    assert_in_epsilon(dist(ax, ay, bx, by, cx, cy), 1.0, epsilon = 0.0001, msg = 'when x and z dimension are zero')
  end

  def test_min
    assert_equal(min(*ARRAY), 'albatross')
  end

  def test_max
    assert_equal(max(*ARRAY), 'horse')
  end
end

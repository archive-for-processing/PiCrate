---
layout: post
title:  "Control Panel<sup>2</sup>"
keywords: library, framework, gui, processing

---
Inspired by Nodebox, picrate (copied from ruby-processing) provides a way to control the instance variables of your sketch with a control panel. You can create sliders, buttons, menus and checkboxes that set instance variables on your sketch. Since ruby-processing-2.0 you need to explicitly set the panel visible from the processing sketch (see included examples). Start by loading in the `control_panel` library, and then define your panel like so:-
NB: revised version for picrate-2.7.2+

__Simple Buttons Example__

```ruby
require 'picrate'

class SimpleButton < Processing::App
  load_library :control_panel

  attr_reader :back

  def setup
    sketch_title 'Simple Button'
    control_panel do |c|
      c.look_feel 'Nimbus'
      c.title 'Control Button'
      c.button :color_background # needs a defined :color_background method
      c.button :exit { exit } # button with optional block
    end
    color_mode RGB, 1
    @back = [0, 0, 1.0]
  end

  def color_background
    @back = [rand, rand, rand]
  end

  def draw
    background *back
  end

  def settings
    size 300, 300
  end
end

SimpleButton.new

```
__More Complete Example__

```ruby

require 'picrate'

class ControlPanelExample < Processing::App
  load_library :control_panel

  def settings
    size(200, 200)
  end

  def setup
    sketch_title 'Control Panel Example'
    control_panel do |c|
      c.look_feel "Nimbus"
      c.slider :opacity
      c.slider(:app_width, 5..60, 20) { reset! } # see reset! method
      c.menu(:options, ['one', 'two', 'three'], 'two') { |m| load_menu_item(m) }
      c.checkbox :paused
      c.button :reset!
    end
  end

  def draw
  # Rest of the code follows
  end

  # eg
  def reset!
    # some action you want performed on button pressed
  end
end

ControlPanelExample.new

```

This code will create a sketch with a control panel for adjusting the value of the `@opacity`, `@app_width`, `@options`, and `@paused` instance variables. The button will call the `reset!` method when clicked (a method defined by you in your sketch). The `app_width` slider will range from 5 to 60 instead of (the default) 0 to 100. The instance variable will be initialized at 20 when the sketch is loaded. The `app_width` and `options` controls have had callbacks attached to them. The callbacks will run, passing in the value of the control, any time the control changes. It all looks like this:

![control panel](http://s3.amazonaws.com/jashkenas/images/control_panel.png)

Here is the classic ruby-processing JWishy sketch translated for picrate, basically you enter the control_panel items in a block, to experiment just add a single item at a time and check that it works (eg :button or :checkbox)

Start by loading in the control_panel library, and then define your panel in setup like so:

```ruby
require 'picrate'

class JWishy < Processing::App
  load_library :control_panel
  attr_reader :panel

  def settings
    size 600, 600
  end

  def setup
    sketch_title 'Wishy Worm'
    control_panel do |c|
      c.title 'Control Panel'
      c.look_feel 'Nimbus'
      c.slider    :bluish, 0.0..1.0, 0.5
      c.slider    :alpha,  0.0..1.0, 0.5
      c.checkbox  :go_big
      c.button    :reset
      c.menu      :shape, %w(oval square triangle)
    end
    @hide = false
    @shape = 'oval'
    @go_big = false
    @x_wiggle, @y_wiggle = 10.0, 0
    @magnitude = 8.15
    @back_color = [0.06, 0.03, 0.18]
    color_mode RGB, 1
    ellipse_mode CORNER
    smooth
  end

  #....rest of code

  def draw
    #.... rest of draw
  end

```
![JWishy]({{site.github.url}}/assets/jwishy.png)

See also [penrose](https://github.com/ruby-processing/picrate-examples/blob/master/processing_app/library/vecmath/vec2d/penrose.rb) and [bezier playground](https://github.com/ruby-processing/picrate-examples/blob/master/contributed/bezier_playground.rb) sketches. See ruby code [here](https://github.com/ruby-processing/picrate/blob/master/library/control_panel/control_panel.rb).

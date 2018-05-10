---
layout: post
title:  "mouse_pressed"
permalink: methods/mouse_pressed.html
---
In vanilla processing [mousePressed][mousePressed] is both a variable and a method, for PiCrate the boolean variable is available as `mouse_pressed?`, whereas you can create events/operations that occur on mouse pressed by adding a [mouse_pressed][mouse_pressed] method as below:-

```ruby
def mouse_pressed  
  # code gets executed on mouse pressed
end
```

For sketch with mouse_pressed method see [drawolver][drawolver], follow link for a sketch using [mouse_pressed?][mouse_pressed?].

See also:-

[mouse_released][mouse_released], [mouse_dragged][mouse_dragged], [mouse_clicked][mouse_clicked]

[mouse_pressed?]:https://github.com/ruby-processing/JRubyArt-examples/blob/master/basics/input/mouse_press.rb
[mousePressed]:https://processing.org/reference/mousePressed_.html
[drawolver]:https://github.com/ruby-processing/picrate-examples/blob/master/demos/drawolver.rb
[mouse_released]:https://github.com/ruby-processing/picrate-examples/blob/master/demos/bezier_playground.rb
[mouse_dragged]:https://github.com/ruby-processing/picrate-examples/blob/master/demos/bezier_playground.rb
[mouse_clicked]:https://github.com/ruby-processing/picrate-examples/blob/master/demos/fibonacci_sphere.rb

---
layout: post
title:  "processing API"
permalink: methods/processingapi.html
---
Most of the processing methods, as explained in the [Processing Language API][api], are available as instance methods to the Processing::App. (frame_rate, ellipse, many others).  But there are [exceptions][alternatives] see below and [here][alternatives], where good or better alternatives already exist in ruby. Also make sure you take a look at the many [included example sketches][sketches], where ruby [core][core] and [Math][Math] methods are preferred over the processing/java alternative eg `rand(0.0..4)` is preferred over `random(0, 4.0)`.

```ruby
#!/usr/bin/env jruby -w
require 'picrate'
class TrianglesGoneWild < Processing::App
  def settings
    size 600, 600
    smooth 8
  end

  def setup
    sketch_title 'Triangles Gone Wild'
    color_mode RGB, 1.0
    frame_rate 30
    fill 0.8, 0.6
  end

  def draw
    triangle(rand(width), rand(height), rand(width), rand(height), rand(width), rand(height))
  end
end

TrianglesGoneWild.new
```

Some variables that you might expect to find under their Processing names are available by more rubyish names, `keyPressed` becomes `key_pressed?` and `mousePressed` becomes `mouse_pressed?`. The functions `keyPressed`, `mousePressed` become `key_pressed` and `mouse_pressed` ie without `?`. And some things are better done with regular Ruby than with Processing; instead of using `load_strings('file.txt')` to read in a file, consider `File.readlines('file.txt')`. For math use `x.to_f`, `x.radians` and `x**3` for `float(x)`, `radians(x)` and `pow(x, 3)`.

Because of this method madness, `Processing::App` has a convenience method for searching through them. `find_method('ellipse')` will return a list of the method names that may match what you're looking for: 'ellipse', 'ellipseMode', and 'ellipse_mode'. Please note this is an instance method, so from irb or pry use `Propane.app.find_method 'ellipse'` on a loaded sketch. Alternatively add `puts find_method 'ellipse'` at the end of your `setup` method (or `draw` but only with `no_loop`).

Also prefer [`Vec2D`][vec2] and [`Vec3D`][vec3] to [`PVector`][pvector] follow links for reference. Also you can/should use `data_path` to wrap filenames (propane uses ruby to access the absolute_path of files in the sketch data folder, this avoids the file permission issues of the vanilla-processing method).

[api]:https://processing.org/reference/index.html
[vec2]:{{site.github.url}}/classes/vec2d/
[vec3]:{{site.github.url}}/classes/vec3d/
[alternatives]:{{site.github.url}}/methods/alternative_methods/
[pvector]:https://processing.org/reference/PVector.html
[Math]:https://ruby-doc.org/core-2.2.3/Math.html
[core]:https://ruby-doc.org/core-2.2.3/
[sketches]:https://github.com/ruby-processing/JRubyArt-examples/
[settings]:https://processing.org/reference/settings_.html

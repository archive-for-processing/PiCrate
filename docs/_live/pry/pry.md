---
layout: post
title:  "pry"
keywords: ruby, java, jruby
permalink: live/pry.html
---
### Live coding with pry and vim ###

First you will need to `jgem install pry`

Easy use configuration in your `~/.bashrc` (many linux distros) or `~/.profile`

```bash
alias jpry="jruby -e \"require 'pry'; binding.pry\""
```
Then firing up pry with jruby is as simple as

```bash
jpry
```
For live editing with vim (there is is an emacs alternative see [pry wiki][prywiki])

You should also create or edit `~/.pryrc` to set the live editor

```bash
Pry.config.editor = 'vim'
```
Fire up the pry console then at pry prompt:-

```ruby
"load 'fred_sketch.rb'"
fred = FredSketch.new
edit FredSketch
```
Screen shot on edit from pry

![pry]({{ site.github.url }}/assets/edit_vim.png)

Screen shot on `:wq` from vim

![pry]({{ site.github.url }}/assets/vim_save.png)

Or if you just wanted to edit the draw loop

`edit -p FredSketch#draw`

[prywiki]:https://github.com/pry/pry/wiki/Customization-and-configuration

But there's much more you can use the pry console for, like regular ruby you can look up methods constants etc:-

```ruby
require 'picrate'
# => true
Java::ProcessingCore::PConstants.constants
# => [:PATH,
# :DISABLE_TEXTURE_MIPMAPS,
# :POLYGON,
# :POSTERIZE,
# :ENABLE_DEPTH_TEST,
# :TEXT,
# :BOTTOM,
# :CLOSE,
# :MIN_INT,
# ...]
Java::ProcessingCore::PConstants::P3D
# => "processing.opengl.PGraphics3D"
Java::ProcessingCore::PApplet.methods
# [:create_reader,
# :year,
# :java_method,
# :degrees,
# :blend_color,
# :show_variation_warning,
# :runSketch,
# :lerpColor,
# :shorten,
# :trim,
# :sqrt,
# :calcSketchPath,
# ...]
# Note snake case methods, also not all the methods will be useful in `PiCrate`
```

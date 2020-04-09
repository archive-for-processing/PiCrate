---
layout: post
title:  "sketch_title"
permalink: methods/sketch_title.html
---
The `sketch_title` method is probably unique to picrate and JRubyArt, it is a convenient way to set the title of the sketch frame. Normally you only want to set the title once, so sensible it belongs in the setup definition.

```ruby
def setup
  sketch_title 'My sketch'
end
```

Should you want a dynamic readout of say `frame_rate`, put it in the draw loop (however there will most likely be some sort of performance penalty) eg:-

```ruby

TITLE_FORMAT = 'frame: %d - fps %0.2f'.freeze
  # ... some code
def draw
  sketch_title(format(TITLE_FORMAT, frame_count, frame_rate)) if frame_count % 10 == 0
  # ... some code
end
```

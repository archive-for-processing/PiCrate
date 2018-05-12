---
layout: post
title:  "Processing::Proxy"
keywords: processing, module, namespace
permalink: modules/processing_proxy.html
---
The sole purpose of the `Processing::Proxy` module is to provide access to the `Processing::App` variables and methods similar to the access to [Inner classes][inner] afforded by vanilla processing. To do this your class should `include Processing::Proxy` as below:-

```ruby
class MyClass
  include Processing::Proxy
  # access to sketch methods and variables is similar to java Inner class
end
```

Now we know this is not `kosher` and as you get more comfortable with propane you may eschew this egregious hack, but initially at least you will find it highly convenient. There are plenty of examples included with the samples (because it so damn convenient). See [frame_of_reference][sketch] sketch and [Plane][Plane] and [Cylinder][Cylinder] classes


[sketch]:https://github.com/ruby-processing/picrate-examples/blob/master/library/vecmath/vec3d/frame_of_reference.rb
[Plane]:https://github.com/ruby-processing/picrate-examples/blob/master/library/vecmath/vec3d/library/geometry/lib/plane.rb
[Cylinder]:https://github.com/ruby-processing/picrate-examples/blob/master/library/vecmath/vec3d/library/geometry/lib/cylinder.rb

The hair shirted brigade might want to take a look at `forwardable` and make their classes `extend Forwardable` instead. There are some examples include with the samples see the [revolute_joint][joint] pbox2d example with the [Windmill][Windmill] and [ParticleSystem][ParticleSystem] classes for example.

[joint]:https://github.com/ruby-processing/picrate-examples/blob/examples/forwardable_module_examples/pbox2d/revolute_joint/revolute_joint.rb
[Windmill]:https://github.com/ruby-processing/picrate-examples/blob/examples/forwardable_module_examples/pbox2d/revolute_joint/master/library/revolute_joint/lib/windmill.rb
[ParticleSystem]:https://github.com/ruby-processing/picrate-examples/blob/examples/forwardable_module_examples/pbox2d/revolute_joint/revolute_joint/lib/particle_system.rb
[inner]: {{ site.github.url }}/magic/java

---
layout: post
title:  "Ruby"
keywords: ruby, java, meta
permalink: magic/custom.html
---
Here will go stuff about [meta programming][meta] etc, which is how we bring you Processing::Proxy etc see `app.rb`.

Using a Proxy module we are able create `java inner class` type access to including classes (_like vanilla processing_), we do this by creating custom method `:method_missing` and `:respond_to_missing?` methods

```ruby

# @HACK purists may prefer 'forwardable' to the use of Proxy
# Importing PConstants here to access the processing constants
module Proxy
  include Math
  include HelperMethods
  include Java::ProcessingCore::PConstants

  def respond_to_missing?(symbol, include_private = false)
    Picrate.app.respond_to?(symbol, include_private) || super
  end

  def method_missing(name, *args, &block)
    return Picrate.app.send(name, *args) if Picrate.app.respond_to? name
    super
  end
end # Processing::Proxy
```

[meta]:https://www.toptal.com/ruby/ruby-metaprogramming-cooler-than-it-sounds

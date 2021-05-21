vertere
=============

* ***This repository is archived***
* ***No longer maintained***
* ***All versions have been yanked from https://rubygems.org/ for releasing valuable namespace for others***

Description
-----------

Get wrapper for inverted comparisons.

Features
--------

### Wraps

* #==
* #===
* #=~
* #<=>

Usage
-----

```ruby
require 'vertere'

# An approaching to invert comparisons
num_chars = %w[0 1 9 10 11]
num_chars.grep(/0/)                  #=> ["0", "10"]
num_chars.grep(Veretere.invert(/0/)) #=> ["1", "9", "11"]
    
# Extend core classies
require 'vertere/core_ext'
num_chars.grep(/0/.for_!)            #=> ["1", "9", "11"]

# And more
num_chars.sort_by{|s|s.to_i.for_!}   #=> ["11", "10", "9", "1", "0"]
```

But I suggest [Enumerable#grep_v from Ruby 2.3](https://bugs.ruby-lang.org/issues/11049) :).

Requirements
-------------

* [Ruby 2.5 or later](http://travis-ci.org/#!/kachick/vertere)

License
--------

The MIT X11 License  
Copyright (c) 2012 Kenichi Kamiya  
See MIT-LICENSE for further details.

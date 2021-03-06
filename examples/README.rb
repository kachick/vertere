#!/usr/bin/env ruby

$VERBOSE = true

require_relative '../lib/vertere'

num_chars = %w[0 1 9 10 11].freeze
p num_chars.grep(/0/)                #=> ["0", "10"]
p(/0/ =~ '0')                        #=> 0

require_relative '../lib/vertere/core_ext'

p num_chars.grep(/0/.for_!) #=> ["1", "9", "11"]
p(/0/.for_! =~ '0')                  #=> false
p num_chars.grep(/0/)                #=> ["0", "10"]
p num_chars.sort_by(&:to_i)          #=> ["0", "1", "9", "10", "11"]
p num_chars.sort_by{|s|s.to_i.for_!} #=> ["11", "10", "9", "1", "0"]
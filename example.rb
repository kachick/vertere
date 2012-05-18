#!/usr/bin/ruby -w

require_relative 'lib/vertere'

# An approach for [ruby-talk:392128]
#  http://www.ruby-forum.com/topic/3418285

NUMBER_CHARS = ('0'..'11').map(&:freeze).freeze
p NUMBER_CHARS
p NUMBER_CHARS.grep(/0/)
p(/0/ =~ '0')

require_relative 'lib/vertere/ext'

p NUMBER_CHARS.grep(/0/.for_!)
p(/0/.for_! =~ '0')
p NUMBER_CHARS.grep(/0/)
p NUMBER_CHARS.sort_by(&:to_i)
p NUMBER_CHARS.sort_by{|s|s.to_i.for_!}
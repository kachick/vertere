$VERBOSE = true
require_relative 'test_helper'

class TestVertere < Test::Unit::TestCase
  NUMBER_CHARS = ('0'..'11').map(&:freeze).freeze
  
  def test_compare
    assert_equal(["0", "10"], NUMBER_CHARS.grep(/0/))
    assert_equal((NUMBER_CHARS - ["0", "10"]), NUMBER_CHARS.grep(Vertere.invert(/0/)))
    assert_equal((NUMBER_CHARS - ["0", "10"]), NUMBER_CHARS.grep(/0/.for_!))
    assert_equal(false, (/0/.for_! =~ '0'))
    assert_equal(["0", "10"], NUMBER_CHARS.grep(/0/)) # check not bloken
    assert_equal(NUMBER_CHARS, NUMBER_CHARS.sort_by(&:to_i))
    assert_equal(NUMBER_CHARS.reverse, NUMBER_CHARS.sort_by{|s|s.to_i.for_!})
  end
  
  def test_methods_minimum_defined
    obj = Object.new
    assert_equal(true, obj.respond_to?(:=~))
    obj.singleton_class.class_eval do
      undef_method :=~
    end
    assert_equal(false, obj.respond_to?(:=~))
    assert_equal(false, obj.for_!.respond_to?(:=~))
  end
  
  def test_check_methods
    obj = Object.new
    assert_equal(false, obj.comparison_inverted?)
    assert_equal(true, obj.for_!.comparison_inverted?)
  end
end

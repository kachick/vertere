require_relative 'helper'

class TestVertere < Test::Unit::TestCase
  
  def test_compare
    num_chars = ('0'..'11').map(&:freeze).freeze

    assert_equal(["0", "10"], num_chars.grep(/0/))
    assert_equal((num_chars - ["0", "10"]), num_chars.grep(Vertere.invert(/0/)))
    assert_equal((num_chars - ["0", "10"]), num_chars.grep(/0/.for_!))
    assert_equal(false, (/0/.for_! =~ '0'))
    assert_equal(["0", "10"], num_chars.grep(/0/)) # check not bloken
    assert_equal(num_chars, num_chars.sort_by(&:to_i))
    assert_equal(num_chars.reverse, num_chars.sort_by{|s|s.to_i.for_!})
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
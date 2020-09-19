require './test/test_helper'
require './lib/key'
require 'pry'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_random_five_digits
    key = Key.new

    assert_equal 5, key.random_five_digits.length
    
    key.stubs(:random_five_digits).returns('keys')

    assert_equal 'keys', key.random_five_digits
  end
end

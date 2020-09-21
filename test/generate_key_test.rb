require './test/test_helper'
require './lib/generate_key'
require 'pry'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_random_five_digits
    key = Key.new

    assert_equal 5, key.random_five_digits.length

    key.stubs(:rand).returns('1')

    assert_equal '11111', key.random_five_digits
  end
end

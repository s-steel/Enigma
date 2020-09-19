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
    key.stubs(:random_five_digits).returns([1, 2, 3, 4, 5])
    assert_equal [1, 2, 3, 4, 5], key.random_five_digits
  end

  def test_split_up_keys
    key = Key.new

    expected = {:a => 12,
                :b => 65,
                :c => 21,
                :d => 01}

    assert_equal expected, key.split_up_keys
  end 
end

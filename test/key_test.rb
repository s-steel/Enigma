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
    random_1 = mock('1')
    random_2 = mock('2')
    random_3 = mock('3')
    random_4 = mock('4')
    expected = {:a => random_1,
                :b => random_2,
                :c => random_3,
                :d => random_4}
    key.stubs(:split_up_keys).returns(expected)

    assert_equal expected, key.split_up_keys
  end
end

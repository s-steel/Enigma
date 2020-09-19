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
    array_keys = mock('random array of keys')
    key.stubs(:random_five_digits).returns([array_keys])
    assert_equal [array_keys], key.random_five_digits
  end

  def test_hash_of_keys
    key = Key.new
    mock_expected = {:a => 1,
                     :b => 2,
                     :c => 3,
                     :d => 4}
    key.stubs(:hash_of_keys).returns(mock_expected)
    expected = {:a => 1,
                :b => 2,
                :c => 3,
                :d => 4}

    assert_equal expected, key.hash_of_keys
  end
end

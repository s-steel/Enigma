require './test/test_helper'
require './lib/shift'
require 'pry'

class ShiftTest < Minitest::Test

  def test_it_exists
    shift = Shift.new

    assert_instance_of Shift, shift
  end

  def test_key
    shift = Shift.new
    mock_expected = {:a => 1,
                     :b => 2,
                     :c => 3,
                     :d => 4}
    shift.stubs(:key).returns(mock_expected)
    expected = {:a => 1,
                :b => 2,
                :c => 3,
                :d => 4}

    assert_equal expected, shift.key
  end

  def test_offset
    shift = Shift.new
    expected = {:a => 6,
                :b => 4,
                :c => 0,
                :d => 0}

    assert_equal expected, shift.offset
  end
end

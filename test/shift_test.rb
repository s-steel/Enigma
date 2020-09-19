require './test/test_helper'
require './lib/shift'
require 'pry'

class ShiftTest < Minitest::Test

  def test_it_exists
    shift = Shift.new('Hello World', '02715', '040895')

    assert_instance_of Shift, shift
    assert_equal 'Hello World', shift.string
    assert_equal '02715', shift.key
    assert_equal '040895', shift.date
  end

  # def test_key
  #   shift = Shift.new
  #   mock_expected = {:a => 1,
  #                    :b => 2,
  #                    :c => 3,
  #                    :d => 4}
  #   shift.stubs(:key).returns(mock_expected)
  #   expected = {:a => 1,
  #               :b => 2,
  #               :c => 3,
  #               :d => 4}
  #
  #   assert_equal expected, shift.key
  # end
  #
  # def test_offset
  #   shift = Shift.new
  #   expected = {:a => 6,
  #               :b => 4,
  #               :c => 0,
  #               :d => 0}
  #
  #   assert_equal expected, shift.offset
  # end
  #
  # def test_total_shift_amount
  #   shift = Shift.new
  #   mock_expected = {:a => 1,
  #                    :b => 2,
  #                    :c => 3,
  #                    :d => 4}
  #   shift.stubs(:total_shift_amount).returns(mock_expected)
  #   expected = {:a => 1,
  #               :b => 2,
  #               :c => 3,
  #               :d => 4}
  #
  #   assert_equal expected, shift.total_shift_amount
  # end
end

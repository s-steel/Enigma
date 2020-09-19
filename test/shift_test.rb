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

    shift_2 = Shift.new('Hello World')
    shift_2.stubs(:key).returns('key string')
    shift_2.stubs(:date).returns('date string')

    assert_equal 'Hello World', shift_2.string
    assert_equal 'key string', shift_2.key
    assert_equal 'date string', shift_2.date
  end

  def test_convert_date
    shift = Shift.new('Hello World', '02715', '040895')

    assert_equal '1025', shift.convert_date
  end

  def test_total_shift_amount
    shift = Shift.new('Hello World', '02715', '040895')
    expected = {:a => 3,
                :b => 27,
                :c => 73,
                :d => 20}
    assert_equal expected, shift.total_shift_amount

    shift_2 = Shift.new('Hello World', '95341', '093765')
    expected_2 = {:a => 100,
                :b => 55,
                :c => 36,
                :d => 46}

    assert_equal expected_2, shift_2.total_shift_amount
  end
end

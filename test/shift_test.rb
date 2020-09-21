require './test/test_helper'
require './lib/shift'
require 'pry'

class ShiftTest < Minitest::Test

  def test_it_exists
    shift = Shift.new('Hello World', '02715', '040895')

    assert_instance_of Shift, shift
    assert_equal 'Hello World', shift.message
    assert_equal '02715', shift.key
    assert_equal '040895', shift.date

    shift_2 = Shift.new('Hello World')
    key_mock = mock('random key')
    shift_2.stubs(:key).returns(key_mock)
    date_mock = mock("today's date")
    shift_2.stubs(:date).returns(date_mock)

    assert_equal 'Hello World', shift_2.message
    assert_equal key_mock, shift_2.key
    assert_equal date_mock, shift_2.date
  end

  def test_date_shift
    shift = Shift.new('Hello World', '02715', '040895')

    assert_equal '1025', shift.date_shift
  end

  def test_total_shift_amount
    shift = Shift.new('Hello World', '02715', '040895')
    expected = {:a => 3,
                :b => 27,
                :c => 73,
                :d => 20}
    assert_equal expected, shift.total_shift_amount

    shift_2 = Shift.new('Hello Space', '95341', '093765')
    expected_2 = {:a => 100,
                  :b => 55,
                  :c => 36,
                  :d => 46}

    assert_equal expected_2, shift_2.total_shift_amount
  end

  def test_encrypt_message
    shift = Shift.new('Hello World', '02715', '040895')
    assert_equal 'keder ohulw', shift.encrypt_message

    shift_2 = Shift.new('Hello World!', '02715', '040895')
    assert_equal 'keder ohulw!', shift_2.encrypt_message

    shift_3 = Shift.new('Hello Space', '01020', '010203')
    assert_equal 'jqnnqlurcog', shift_3.encrypt_message

    shift_4 = Shift.new('? : # * }', '01020', '010203')
    assert_equal '?l:b#l*b}', shift_4.encrypt_message
  end

  def test_encrypt_a_shift
    shift = Shift.new('Hello World', '02715', '040895')

    assert_equal 'k', shift.encrypt_a_shift('h')
  end

  def test_encrypt_b_shift
    shift = Shift.new('Hello World', '02715', '040895')

    assert_equal 'e', shift.encrypt_b_shift('e')
  end

  def test_encrypt_c_shift
    shift = Shift.new('Hello World', '02715', '040895')

    assert_equal 'd', shift.encrypt_c_shift('l')
  end

  def test_encrypt_d_shift
    shift = Shift.new('Hello World', '02715', '040895')

    assert_equal 'e', shift.encrypt_d_shift('l')
  end

  def test_decrypt_message
    shift = Shift.new('keder ohulw', '02715', '040895')
    assert_equal 'hello world', shift.decrypt_message

    shift_2 = Shift.new('keder ohulw!', '02715', '040895')
    assert_equal 'hello world!', shift_2.decrypt_message

    shift_3 = Shift.new('jqnnqlurcog', '01020', '010203')
    assert_equal 'hello space', shift_3.decrypt_message

    shift_4 = Shift.new('?l:b#l*b}', '01020', '010203')
    assert_equal '? : # * }', shift_4.decrypt_message
  end

  def test_decrypt_a_shift
    shift = Shift.new('keder ohulw', '02715', '040895')

    assert_equal 'h', shift.decrypt_a_shift('k')
  end

  def test_decrypt_b_shift
    shift = Shift.new('keder ohulw', '02715', '040895')

    assert_equal 'e', shift.decrypt_b_shift('e')
  end

  def test_decrypt_c_shift
    shift = Shift.new('keder ohulw', '02715', '040895')

    assert_equal 'l', shift.decrypt_c_shift('d')
  end

  def test_decrypt_d_shift
    shift = Shift.new('keder ohulw', '02715', '040895')

    assert_equal 'l', shift.decrypt_d_shift('e')
  end
end

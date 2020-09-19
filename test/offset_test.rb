require './test/test_helper'
require './lib/offset'
require 'pry'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
    assert_equal 190920, offset.date
  end

  def test_create_offset_digits_from_date
    offset = Offset.new

    assert_equal [6, 4, 0, 0], offset.offset_digits_from_date
  end

  def test_offset_hash
    offset = Offset.new

    expected = {:a => 6,
                :b => 4,
                :c => 0,
                :d => 0}
    assert_equal expected, offset.offset_hash
  end
end

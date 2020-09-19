require './test/test_helper'
require './lib/offset'
require 'pry'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
    assert_equal '190920', offset.date
  end

  def test_create_offset_digits_from_date
    offset = Offset.new

    assert_equal '6400', offset.offset_digits_from_date
  end
end

require './test/test_helper'
require './lib/offset'
require 'pry'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
  end

  def test_date
    offset = Offset.new
    test_date = mock('date')
    offset.stubs(:date).returns(test_date)
    assert_equal test_date, offset.date
  end
end

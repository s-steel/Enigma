require './test/test_helper'
require './lib/offset'
require 'pry'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
    assert_equal '190920', offset.date
  end
end

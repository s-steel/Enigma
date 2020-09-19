require './test/test_helper'
require './lib/shift'
require 'pry'

class ShiftTest < Minitest::Test

  def test_it_exists
    shift = Shift.new

    assert_instance_of Shift, shift
  end

  def test_keys
    shift = Shift.new

    assert_equal [], shift.pull_key
  end
end

require './test/test_helper'
require './lib/key'
require 'pry'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end
end 

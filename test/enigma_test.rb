require './test/test_helper'
require './lib/enigma'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_encrypt
    enigma = Enigma.new

    expected = {:encryption => '',
                :key => '02715',
                :date => '040895'}
    assert_equal expected, enigma.encrypt('Hello World', '02715', '040895')
  end
end

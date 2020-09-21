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

    expected = {:encryption => 'keder ohulw',
                :key => '02715',
                :date => '040895'}
    assert_equal expected, enigma.encrypt('hello world', '02715', '040895')

    enigma2 = Enigma.new
    expected2 = {:encryption => 'pib wdmczpu',
                :key => '02715',
                :date => '210920'}
    assert_equal expected2, enigma2.encrypt('hello world', '02715')

    enigma3 = Enigma.new
    expected3 = {:encryption => 'mock this?',
                :key => 'mock this?',
                :date => '190920'}
    assert_equal expected3, enigma3.encrypt('hello world')

    expected3 = {:encryption => 'jqnnqlurcog!',
                :key => '01020',
                :date => '010203'}
    assert_equal expected3, enigma.encrypt('Hello Space!', '01020', '010203')

    expected4 = {:encryption => '?l:b#l*b}',
                :key => '01020',
                :date => '010203'}
    assert_equal expected4, enigma.encrypt('? : # * }', '01020', '010203')
  end

  def test_decrypt
    enigma = Enigma.new

    expected = {:decryption => 'hello world',
                :key => '02715',
                :date => '040895'}
    assert_equal expected, enigma.decrypt('keder ohulw', '02715', '040895')

    expected2 = {:decryption => 'hello space!',
                :key => '01020',
                :date => '010203'}
    assert_equal expected2, enigma.decrypt('jqnnqlurcog!', '01020', '010203')

    expected3 = {:decryption => '? : # * }',
                :key => '01020',
                :date => '010203'}
    assert_equal expected3, enigma.decrypt('?l:b#l*b}', '01020', '010203')

    enigma2 = Enigma.new
    expected4 = {:decryption => '? : # * }',
                :key => '01020',
                :date => '210920'}
    assert_equal expected4, enigma2.decrypt('keder ohulw', '01020')

    # enigma2 = Enigma.new
    # enigma2.encrypt('hello world', '02715')


  end
end

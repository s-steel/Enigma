require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_has_attributes
    enigma = Enigma.new
    assert_instance_of Enigma, enigma

    expected = {}
    assert_equal expected, enigma.encryption
    assert_equal expected, enigma.decryption
    assert_nil enigma.date
    assert_nil enigma.key
  end

  def test_encrypt
    enigma = Enigma.new

    expected = {:encryption => 'keder ohulw',
                :key => '02715',
                :date => '040895'}
    assert_equal expected, enigma.encrypt('hello world', '02715', '040895')

    expected3 = {:encryption => 'jqnnqlurcog!',
                :key => '01020',
                :date => '010203'}
    assert_equal expected3, enigma.encrypt('Hello Space!', '01020', '010203')

    expected4 = {:encryption => '?l:b#l*b}',
                :key => '01020',
                :date => '010203'}
    assert_equal expected4, enigma.encrypt('? : # * }', '01020', '010203')
  end

  def test_encrypt_without_date
    enigma = Enigma.new
    expected = {:encryption => 'mock',
                :key => '02715',
                :date => 'mock'}
    enigma.stubs(:encrypt).returns(expected)

    assert_equal expected, enigma.encrypt('hello world', '02715')
  end

  def test_encrypt_without_key_or_date
    enigma = Enigma.new
    expected = {:encryption => 'mock',
                :key => 'mock',
                :date => 'mock'}
    enigma.stubs(:encrypt).returns(expected)

    assert_equal expected, enigma.encrypt('hello world')
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
  end

  def test_decrypt_without_date
    enigma = Enigma.new
    expected = {:decryption => 'mock',
                :key => '01020',
                :date => 'mock'}
    enigma.stubs(:decrypt).returns(expected)
    assert_equal expected, enigma.decrypt('keder ohulw', '01020')
  end

  def test_decrypt_from_encryption_key
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715", '040895')

    expected = {:decryption => 'hello world',
                :key => '02715',
                :date => '040895'}
    assert_equal expected, enigma.decrypt(encrypted[:encryption], '02715', '040895')
  end
end

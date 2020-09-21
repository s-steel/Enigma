require_relative 'generate_key'
require_relative 'generate_date'
require 'pry'

class Shift
  attr_reader :message, :key, :date, :characters
  def initialize(message,
                 key = Key.new.key,
                 date = GenerateDate.new.date)
    @message = message
    @key = key
    @date = date
    @characters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
                   'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
                   'u', 'v', 'w', 'x', 'y', 'z', ' ']
  end

  def total_shift_amount
    {:a => @key[0..1].to_i + date_shift[0].to_i,
     :b => @key[1..2].to_i + date_shift[1].to_i,
     :c => @key[2..3].to_i + date_shift[2].to_i,
     :d => @key[3..4].to_i + date_shift[3].to_i}
  end

  def date_shift
    (@date.to_i ** 2).digits.reverse[-4..-1].join.to_s
  end

  def encrypt_message
    encrypt_array = []
    index = 0
    @message.downcase.each_char do |character|
      if @characters.include?(character) == false
        encrypt_array << character
      elsif index == 0
        encrypt_array << encrypt_a_shift(character)
      elsif index == 1
        encrypt_array << encrypt_b_shift(character)
      elsif index == 2
        encrypt_array << encrypt_c_shift(character)
      elsif index == 3
        encrypt_array << encrypt_d_shift(character)
      else
        character
      end
      index += 1
      index = 0 if index > 3
    end
    encrypt_array.join
  end

  def encrypt_a_shift(character)
    shift_hash = Hash[@characters.zip(@characters.rotate(total_shift_amount[:a]))]
    shift_hash[character]
  end

  def encrypt_b_shift(character)
    shift_hash = Hash[@characters.zip(@characters.rotate(total_shift_amount[:b]))]
    shift_hash[character]
  end

  def encrypt_c_shift(character)
    shift_hash = Hash[@characters.zip(@characters.rotate(total_shift_amount[:c]))]
    shift_hash[character]
  end

  def encrypt_d_shift(character)
    shift_hash = Hash[@characters.zip(@characters.rotate(total_shift_amount[:d]))]
    shift_hash[character]
  end

  def decrypt_message
    decrypt_array = []
    index = 0
    @message.downcase.each_char do |character|
      if @characters.include?(character) == false
        decrypt_array << character
      elsif index == 0
        decrypt_array << decrypt_a_shift(character)
      elsif index == 1
        decrypt_array << decrypt_b_shift(character)
      elsif index == 2
        decrypt_array << decrypt_c_shift(character)
      elsif index == 3
        decrypt_array << decrypt_d_shift(character)
      else
        character
      end
      index += 1
      index = 0 if index > 3
    end
    decrypt_array.join
  end

  def decrypt_a_shift(character)
    shift_hash = Hash[@characters.zip(@characters.rotate(-total_shift_amount[:a]))]
    shift_hash[character]
  end

  def decrypt_b_shift(character)
    shift_hash = Hash[@characters.zip(@characters.rotate(-total_shift_amount[:b]))]
    shift_hash[character]
  end

  def decrypt_c_shift(character)
    shift_hash = Hash[@characters.zip(@characters.rotate(-total_shift_amount[:c]))]
    shift_hash[character]
  end

  def decrypt_d_shift(character)
    shift_hash = Hash[@characters.zip(@characters.rotate(-total_shift_amount[:d]))]
    shift_hash[character]
  end
end

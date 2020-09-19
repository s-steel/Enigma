require_relative 'shift'
require 'pry'

class Enigma

  def initialize
    @shift = Shift.new('hello world', '02715', '040895')
    @encryption = Hash.new
  end

  def encrypt(message, key, date)
    @encryption[:encryption] = @shift.shift_message
    @encryption[:key] = key
    @encryption[:date] = date
    @encryption
  end
  # def encrypt(message, key = key_method, date = date_method)
  # end
  #
  # def decrypt(cyphertext, key, date = date_method)
  # end

end

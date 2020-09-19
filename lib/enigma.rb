require_relative 'shift'
require 'pry'

class Enigma
  attr_reader :message, :key, :date
  def initialize
    @message = message
    @key = key
    @date = date
  end

  def encrypt(message, key, date)
    @shift = Shift.new(message, key, date)
    encryption = Hash.new
    encryption[:encryption] = @shift.encrypt_message
    encryption[:key] = key
    encryption[:date] = date
    encryption
  end
  # def encrypt(message, key = key_method, date = date_method)
  # end
  #
  # def decrypt(cyphertext, key, date = date_method)
  # end

end

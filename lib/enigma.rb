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

  def decrypt(message, key, date)
    @shift = Shift.new(message, key, date)
    decryption = Hash.new
    decryption[:decryption] = @shift.decrypt_message
    decryption[:key] = key
    decryption[:date] = date
    decryption
  end
end

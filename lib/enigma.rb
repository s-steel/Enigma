require_relative 'shift'
require 'pry'

class Enigma
  attr_reader :message,
              :key,
              :date,
              :encryption,
              :decryption
  def initialize
    @message = message
    @key = key
    @date = date
    @encryption = Hash.new
    @decryption = Hash.new
  end

  def encrypt(message, key, date)
    @shift = Shift.new(message, key, date)
    @encryption[:encryption] = @shift.encrypt_message
    @encryption[:key] = key
    @encryption[:date] = date
    @encryption
  end

  def decrypt(message, key, date)
    @shift = Shift.new(message, key, date)
    @decryption[:decryption] = @shift.decrypt_message
    @decryption[:key] = key
    @decryption[:date] = date
    @decryption
  end
end

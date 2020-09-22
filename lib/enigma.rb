require_relative 'shift'
require_relative 'generate_key'
require_relative 'generate_date'

class Enigma
  include GenerateDate
  include GenerateKey
  attr_reader :message,
              :key,
              :date,
              :encryption,
              :decryption
  def initialize
    @key = key
    @date = date
    @encryption = Hash.new
    @decryption = Hash.new
  end

  def encrypt(message, key = generate_key, date = generate_date)
    @shift = Shift.new(message, key, date)
    key = generate_key if key.length != 5
    date = generate_date if date.length != 6
    @encryption[:encryption] = @shift.encrypt_message
    @encryption[:key] = key
    @encryption[:date] = date
    @encryption
  end

  def decrypt(message, key, date = generate_date)
    date = generate_date if date.nil?
    @shift = Shift.new(message, key, date)
    @decryption[:decryption] = @shift.decrypt_message
    @decryption[:key] = key
    @decryption[:date] = date
    @decryption
  end
end

require_relative 'key'
require_relative 'offset'
require 'pry'

class Shift
  attr_reader :key, :offset
  def initialize
    @key = Key.new.hash_of_keys
    @offset = Offset.new.offset_hash
  end

  def total_shift_amount
    @key.merge(@offset) do |letter, key, offset|
      key + offset
    end
  end
end

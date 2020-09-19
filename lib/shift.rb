require_relative 'key'
require_relative 'offset'
require 'pry'

class Shift
  attr_reader :string, :key, :date
  def initialize(string,
                 key = Key.new.key,
                 date = Offset.new.offset)
    @string = string
    @key = key
    @date = date
    # @characters =
  end

  # def total_shift_amount
  #   @key.merge(@offset) do |letter, key, offset|
  #     key + offset
  #   end
  # end
end

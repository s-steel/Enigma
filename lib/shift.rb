require_relative 'key'
require_relative 'offset'
require 'pry'

class Shift
  attr_reader :message, :key, :date
  def initialize(message,
                 key = Key.new.key,
                 date = Offset.new.offset)
    @message = message
    @key = key
    @date = date
    # @characters =
  end

  def convert_date
    (@date.to_i ** 2).digits.reverse[-4..-1].join.to_s
  end

  def total_shift_amount
    shift_hash = {:a => @key[0..1].to_i + convert_date[0].to_i,
                  :b => @key[1..2].to_i + convert_date[1].to_i,
                  :c => @key[2..3].to_i + convert_date[2].to_i,
                  :d => @key[3..4].to_i + convert_date[3].to_i}
  end

  def shift_message

  end
end

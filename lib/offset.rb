require_relative 'key'
require 'pry'

class Offset
  attr_reader :offset
  def initialize#(offset = calc)
    @offset = offset
  end

  def date
    Date.today.strftime('%d%m%y').to_i
  end

  def offset_digits_from_date
    (date ** 2).digits.reverse[-4..-1]
  end

  def offset_hash
    key_hash = {a: offset_digits_from_date[0].to_i,
                b: offset_digits_from_date[1].to_i,
                c: offset_digits_from_date[2].to_i,
                d: offset_digits_from_date[3].to_i}
  end
end

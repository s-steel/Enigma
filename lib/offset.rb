require 'pry'

class Offset
  attr_reader :offset
  def initialize#(offset = calc)
    @offset = offset
  end

  def date
    Date.today.strftime('%d%m%y')
  end

  def offset_digits_from_date
    (date.to_i ** 2).digits.reverse[-4..-1].join.to_s
  end
end

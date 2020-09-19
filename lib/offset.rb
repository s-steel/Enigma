require_relative 'key'
require 'pry'

class Offset
  attr_reader :offset, :date
  def initialize#(offset = calc)
    @offset = offset
    @date = Date.today
  end

end

require_relative 'key'
require_relative 'offset'

class Shift
  attr_reader :key, :offset
  def initialize
    @key = key
    @offset = offset
  end
end

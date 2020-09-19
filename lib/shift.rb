require_relative 'key'
require_relative 'offset'

class Shift
  attr_reader :key, :offset
  def initialize
    @key = Key.new
    @offset = Offset.new
  end

  def pull_key
    @key.hash_of_keys
  end
end

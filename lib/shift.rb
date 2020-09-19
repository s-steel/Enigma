require_relative 'key'
require_relative 'offset'

class Shift
  attr_reader :key, :offset
  def initialize
    @key = Key.new.hash_of_keys
    @offset = Offset.new.offset_hash
  end
end

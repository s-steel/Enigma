class Key
  attr_reader :key
  def initialize
    @key = key
  end

  def random_five_digits
    5.times.map { rand 10 }.join.to_s
  end
end

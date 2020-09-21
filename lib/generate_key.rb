class Key
  attr_reader :key
  def initialize
    @key = random_five_digits
  end

  def random_five_digits
    5.times.map { rand 10 }.join.to_s
  end
end

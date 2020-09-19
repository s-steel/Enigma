class Key
  def initialize
  end

  def random_five_digits
    5.times.map { rand 10 }
  end
  # ^^ returns array of digits

end

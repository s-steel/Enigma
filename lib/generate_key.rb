module GenerateKey

  def generate_key
    5.times.map { rand 10 }.join.to_s
  end
end

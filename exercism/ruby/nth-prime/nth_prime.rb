class Prime
  PRESETS = {1 => false, 2 => true, 3 => true}

  def self.nth(number)
    raise ArgumentError if number < 1
    primes = []
    checking = 1
    while primes.length < number
      primes << checking if self.is_prime?(checking)
      checking += 1
    end
    primes[-1]
  end

  def self.is_prime?(number)
    return PRESETS[number] if PRESETS.keys.include?(number)
    Range.new(2,number/2).each do |x|
      if number % x == 0
        return PRESETS[number] = false
      end
    end
    PRESETS[number] = true
  end
end

module BookKeeping
  VERSION = 1
end
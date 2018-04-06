class PrimeFactors
  def self.for(number)
    factors = []
    while number > 1
      next_factor = self.lowest_prime_factor(number)
      factors << next_factor
      number /= next_factor
    end
    factors
  end

  def self.lowest_prime_factor(number)
    primes.each do |prime|
      if number % prime == 0
        return prime
      end
    end
    
  end

  def self.primes
    [2,3,5,7,11,13,17,23,461,9539,894119]
  end
end

p PrimeFactors.for(4)


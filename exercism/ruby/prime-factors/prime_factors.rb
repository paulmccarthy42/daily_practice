require 'prime' # depending on use, it would probably be worth building this locally,
# but given how high the numbers are in the tests, I couldn't get the tests to
# run in a reasonable time, so using this

class PrimeFactors
  def self.for(number)
    factors = []
    while number > 1
      next_factor = self.lowest_prime_factor(number)
      factors << next_factor && number /= next_factor if next_factor
    end
    factors
  end

  def self.lowest_prime_factor(number)
    Prime.each(number) do |prime|
      return prime if number % prime == 0
    end
  end

  # ffr, this is pretty easily refactorable to be recursive
end
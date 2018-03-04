class Sieve
  def initialize(num)
    @num = num
    @numbers = (2..@num).to_a
  end

  attr_accessor :numbers

  def primes
    @numbers.select do |prime|
      (@num / prime).times do |x|
        @numbers.delete(prime * (x + 2)) 
        #works but I want to find a better method than delete
        #something that doesn't overwrite @numbers
        #pushing up so I can investigate later
      end
    end
  end
end

module BookKeeping
  VERSION = 1
end

x = Sieve.new(10)

p x.primes
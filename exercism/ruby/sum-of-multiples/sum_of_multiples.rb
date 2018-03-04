class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end

  def to(ceiling)
    (1...ceiling).reduce(0) do |result, x|
      result + (@numbers.any? {|y| x % y == 0} ? x : 0)
    end
  end
end

module BookKeeping
  VERSION = 2
end

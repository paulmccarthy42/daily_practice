class Grains
  def self.square(number)
    raise ArgumentError if number < 1 || number > 64
    2 ** (number - 1)
  end

  def self.total
    (0..64).reduce {|total, number| total + self.square(number)}
  end
end

module BookKeeping
  VERSION = 1
end
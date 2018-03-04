class Binary
  def self.to_decimal(number)
    raise ArgumentError if number.match(/[^01]/)
    number.each_char.with_index.reduce(0) do |sum, (char,index)|
      sum + char.to_i * 2 ** (number.length - index - 1)
    end
  end
end

module BookKeeping
  VERSION = 3
end
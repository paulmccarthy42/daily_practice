class Series
  def initialize(string)
    @string = string
  end

  def slices(length)
    raise ArgumentError if length > @string.length
    slices = []
    @string.each_char.with_index do |char, index|
      slices << @string.slice(index, length) if index + length <= @string.length
    end
    slices
  end
end


class Trinary
  def initialize(number)
    if /\A[012]*\z/ === number
      @number = number
    else
      @number = nil
    end
  end

  def to_decimal
    return 0 if !@number
    sum = 0 #having a hard time getting with_object to play nicely
    @number
      .reverse
      .each_char
      .with_index do |tri_value, index|
      sum += tri_value.to_i * 3 ** index
    end
    sum
  end
end

module BookKeeping
  VERSION = 1
end
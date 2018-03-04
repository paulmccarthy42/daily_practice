class Array
  def accumulate(&function)
    self.each_with_object([]) {|thing, result| result << function.call(thing)}
  end
end

module BookKeeping
  VERSION = 1
end

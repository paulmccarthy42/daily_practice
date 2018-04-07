module Enumerable
  def keep(&function)
    self.select {|x| function.call(x)}
  end

  def discard(&function)
    self.select {|x| !function.call(x)}
  end
end

# p [1,2,3].keep {|x| 2 * x}
# p [1,2,3].discard

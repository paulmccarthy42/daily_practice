module Enumerable
  def keep(&function)
    self.select {|x| function.call(x)}
  end

  def discard(&function)
    self.select {|x| !function.call(x)}
  end
end

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = @phrase.downcase.split(/[ ,]+/).map do |x|
      x.gsub(/^\W+|\W+$/, "")
    end
    words.reduce(Hash.new(0)) do |totals, word|
      totals[word] += 1
      totals
    end
  end
end

module BookKeeping
  VERSION = 1
end
class Pangram
  def self.pangram?(sentence)
    sentence = sentence.downcase
    sentence = sentence.gsub(/(_| )/, "")
    letters = "abcdefghijklmnopqrstuvwxyz".split("")
    sentence.each_char do |letter|
      letters.delete(letter)
    end
    return letters == []
  end
end

module BookKeeping
  VERSION = 6 # Where the version number matches the one in the test.
end
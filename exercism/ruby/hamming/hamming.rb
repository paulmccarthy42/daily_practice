class Hamming
  def self.compute(strand_1, strand_2)
    raise ArgumentError if strand_1.length != strand_2.length
    differences = 0
    strand_1.length.times do |x|
      differences += 1 if strand_1[x] != strand_2[x]
    end
    return differences
  end
end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
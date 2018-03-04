class Complement
  TRANSFORM = {
    "C" => "G",
    "G" => "C",
    "T" => "A",
    "A" => "U"
  }

  def self.of_dna(strand)
    return "" unless strand.match?(/^[GCTA]+$/)
    strand.gsub!(/[GCTA]/) {|x| TRANSFORM[x]}
    strand
  end
end

module BookKeeping
  VERSION = 4
end
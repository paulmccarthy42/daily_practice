class ETL
  def self.transform(old)
    old.each_with_object({}) do |(points, letters), new_hash|
      letters.each do |letter|
        new_hash[letter.downcase] = points
      end
    end
  end
end

module BookKeeping
  VERSION = 1
end
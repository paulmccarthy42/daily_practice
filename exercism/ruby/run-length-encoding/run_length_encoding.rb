class RunLengthEncoding
  def self.encode(input)
    array = input.each_char.with_object([]) do |char,array|
      if array.empty? || array.last[-1] != char 
        array << char 
      else
        array[-1] += char
      end
    end
    array.map {|x| [x.length == 1 ? nil : x.length, x[0]]}.join
  end

  def self.decode(input)
    output = ""
    input.scan(/(\d*)?(\D)/) do |count,char| 
      output += (char * (count == "" ? 1 : count.to_i))
    end
    output
  end
end

module BookKeeping
  VERSION = 3
end

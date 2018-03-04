class Bob

  def self.hey(remark)
    return "Fine. Be that way!" if remark.match?(/^\s+$/) || remark.empty?
    return "Whoa, chill out!" if !remark.match?(/[a-z]/) && remark.match(/[A-Z]/)
    return "Sure." if remark.gsub(/\s/, "")[-1] == "?"
    return "Whatever."
  end
end

module BookKeeping
  VERSION = 1
end
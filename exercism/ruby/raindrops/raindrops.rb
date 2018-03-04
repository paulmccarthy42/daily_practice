class Raindrops
  RAINDROP_BEATS = {
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  def self.convert(number)
    sound = RAINDROP_BEATS.reduce("") { |result,(factor,sound)| number % factor == 0 ? result + sound : result}
    return sound == "" ? number.to_s : sound
  end
end

module BookKeeping
  VERSION = 3
end
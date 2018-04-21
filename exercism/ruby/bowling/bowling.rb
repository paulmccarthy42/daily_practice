class Game
  attr_accessor :frames, :extras #for testing

  BowlingError = "Failed the rules of bowling"

  def initialize
    @frames = [[]]
    @extras = []
    @score = 0
  end

  def ten_frames_over?
    (@frames.length == 10 && !frame_incomplete?) ||
    (@frames.length > 10)
  end

  def score
    raise BowlingError if !ten_frames_over? || @extras.length < extra_roll_total
    @score
  end

  def spare?(frame)
    frame.length == 2 &&
    frame.sum == 10
  end

  def strike?(frame)
    frame == [10] || frame == [0, 10]
  end

  def frame_incomplete?
    @frames.last.length < 2 && 
    @frames.last.sum != 10
  end

  def bonus
    (spare?(@frames.last) ? 1 : 0) + 
    (strike?(@frames.last) ? 1 : 0) + 
    (@frames.flatten[-2] == 10 ? 1 : 0)
  end

  def extra_roll_total
    (spare?(@frames.last) ? 1 : 0) + 
    (strike?(@frames.last) ? 2 : 0) +
    (@frames.flatten[-2] == 10 && !strike?(@frames.last) ? 1 : 0)
  end

  def roll(pins)
    raise BowlingError if !pins.between?(0,10)
    multiplier = bonus + 1
    unless ten_frames_over?
      if frame_incomplete?
        raise BowlingError if @frames.last && pins + @frames.last.sum > 10
        @frames.last << pins
      else
        @frames << [pins]
      end
      @score += pins * multiplier
    else
      raise BowlingError if extra_roll_total <= @extras.length
      raise BowlingError if @extras.first && @extras.first != 10 && @extras.first + pins > 10
      @extras << pins
      @score += pins * (strike?(@frames.last) && strike?(@frames[-2]) && @extras.length == 1 ? 2 : 1)
    end
  end
end

module BookKeeping
  VERSION = 3
end
class Game
  attr_accessor :rolls, :frames #for testing

  BowlingError = "Failed the rules of bowling"

  def initialize
    @score = 0
    @rolls = []
    @frames = [[]]
  end

  def score
    raise BowlingError if @frames.length < 10
    @score
  end

  def spare?
    @frames.last.sum == 10 && !@frames.last.include?(10) && @frames.length < 10
  end

  def new_strike?
    @frames.last.include?(10) && @frames.length < 10
  end

  def old_strike?
    (@rolls.length >= 2 && @rolls[-2] == 10) && @frames.length < 10
  end

  def frame_incomplete?
    @frames.last.last != 10 && @frames.last.length < 2
  end

  def wrong_number_of_pins?(pins)
    !pins.between?(0,10) ||
    (frame_incomplete? && 
      @frames.last.last && 
      @frames.last.last + pins > 10)
  end

  def cant_roll?(x)
    wrong_number_of_pins?(x)

  end

  def roll(pins)
    raise BowlingError if cant_roll?(pins)
    @score += pins if spare?
    @score += pins if new_strike?
    @score += pins if old_strike?

    @score += pins

    @rolls << pins
    if frame_incomplete?
      @frames.last << pins
    else
      @frames << [pins]
    end
  end
end

module BookKeeping
  VERSION = 3
end

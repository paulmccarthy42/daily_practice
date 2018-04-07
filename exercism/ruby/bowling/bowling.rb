class Game
  attr_accessor :score, :rolls

  def initialize
    @score = 0
    @rolls = []
    @last_roll = 0
    @second_last_roll = 0
  end

  def spare?
    @rolls.length > 1 && 
    @rolls[-1] + @rolls[-2] == 10 &&
    @rolls[-1] != 10 &&
    @rolls[-2] != 10
  end

  def new_strike?
    @rolls.length >= 1 && @rolls[-1] == 10
  end

  def old_strike?
    (@rolls.length >= 2 && @rolls[-2] == 10)
  end

  def roll(pins)
    @score += pins if @rolls.length < 20
    @score += pins if spare?
    @score += pins if new_strike?
    @score += pins if old_strike?
    @rolls << pins
  end
end

module BookKeeping
  VERSION = 3
end

# x = Game.new
# x.roll(10)
# x.roll(10)
# x.roll(5)
# p x.score
# p x.rolls
class Player

  attr_accessor :lives
  attr_reader :name

  def initialize(name)
    @name = name 
    @lives = 3 
  end

  def lost?
    lives == 0
  end

  def update_score 
    self.lives -= 1
  end

end

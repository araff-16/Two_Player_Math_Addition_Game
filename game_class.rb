class Game 

  def initialize
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
    @players = [@player1, @player2]
    @round = 1
  end  
  
  # DISPLAYS THE CURRENT SCORE OF THE PLAYERS
  def display_score
    puts 
    puts "***************** Score *****************"
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

  #DISPLAYS THE NAME OF THE WINNER AND THE NUMBER OF LIVES THEY HAVE
  def display_winner
    puts 
    puts "***************** Game Over *****************"
    puts "The winner is #{get_winner.name} with a score of ?????"
  end 

  #CHECKS TO SEE IF ANY PLAYER HAS O LIVES
  def check_game_over
    @players.select {|player| player.lost?}.count > 0
  end 

  #RUNS THE GAME UNTIL A WINNER IS FOUND
  def play 
    puts "Welcome to this awesome math game!"
    puts "Each player starts with 3 lives."
    puts "If a player answers a question incorrectly they lose life"
    puts "The first player to lose all 3 lives loses."

    until check_game_over do 
    end
  end
end


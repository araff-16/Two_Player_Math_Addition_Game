

class Game 

  def initialize
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
    @players = [@player1, @player2]
    @round = 1
  end  
  
  # DISPLAYS THE CURRENT SCORE OF THE PLAYERS
  def display_score
    puts "***************** Score *****************"
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    puts
  end

  #DISPLAYS THE NAME OF THE WINNER AND THE NUMBER OF LIVES THEY HAVE
  def display_winner
    puts 
    puts "***************** Game Over *****************"
    winner = get_winner
    puts "The winner is #{winner.name} with a score of #{winner.lives}/3"
  end 

  def get_winner
    @players.find {|player| !player.lost?}
  end

  #CHECKS TO SEE IF ANY PLAYER HAS O LIVES
  def check_game_over
    @players.select {|player| player.lost?}.count > 0
  end 

  #RETURN FIRST PLAYER IN THE ARRAY
  def get_answering_player
    @players.first
  end

  #SWITCHES PLAYERS
  def new_round
    @players.rotate!
  end

  #CHECKS TO SEE IF THE PLAYER ENTERED THE CORRECT ANSWER
  def check_correctness(sum, answer)
    sum == answer
  end


  #RUNS THE GAME UNTIL A WINNER IS FOUND
  def play 
    puts "Welcome to this awesome math game!"
    puts "Each player starts with 3 lives."
    puts "If a player answers a question incorrectly they lose a life"
    puts "The first player to lose all 3 lives loses."
    puts

    until check_game_over do 

      puts "***************** New Round *****************"
      

      first_num = rand(1..20)
      second_num = rand(1..20) 
      correct_sum = first_num + second_num

      player_to_answer = get_answering_player 

      puts "#{get_answering_player.name}: What does #{first_num} plus #{second_num} equal?"

      player_answer = $stdin.gets.chomp.to_i

      if check_correctness(correct_sum,player_answer)
        puts "You Answered Correctly"
      else 
        puts "Do You Even Know How To Math???!??!"
        puts "You Have Lost A Life"
        player_to_answer.update_score
      end

      display_score
      new_round

    end

    display_winner
  end



end
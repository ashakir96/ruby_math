require './questions'
require './players'

class Game

  def initialize
    puts "Welcome to the Mathalympics!"
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
  end

  def game
      i = 0
      while @player1.life > 0 && @player2.life > 0
        puts "------NEW TURN-------"
        question = Question.new
        if i % 2 == 0
          puts "#{@player1.name}: #{question.question}"
          answer = gets.chomp.to_i
          if question.answer == answer
            puts "correct!"
            puts "#{@player1.name}: #{@player1.life}/3 vs #{@player2.name}: #{@player2.life}/3"
          else
            puts "maybe math isn't your thing..."
            @player1.life -= 1
            puts "#{@player1.name}: #{@player1.life}/3 vs #{@player2.name}: #{@player2.life}/3"
          end
        else
          puts "#{@player2.name}: #{question.question}"
          answer = gets.chomp.to_i
          if question.answer == answer
            puts "correct!"
            puts "#{@player1.name}: #{@player1.life}/3 vs #{@player2.name}: #{@player2.life}/3"
          else
            puts "maybe math isn't your thing..."
            @player2.life -= 1
            puts "#{@player1.name}: #{@player1.life}/3 vs #{@player2.name}: #{@player2.life}/3"
          end
        end

        i+=1
      end

      if @player1.life == 0 || @player2.life == 0
        puts "------GAME OVER-------"
        if @player1.life == 0
          puts "Player 2 wins with a score of #{@player2.life}/3"
        else
          puts "Player 1 wins with a score of #{@player1.life}/3"
        end
    end
  end
end



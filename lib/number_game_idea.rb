# frozen_string_literal: true

# Class to create the random number
# class RandomNumber
#   attr_reader :number

#   def initialize
#     @number = rand(0..9)
#   end
# end

# Class to display the random number
class GameBoard
  attr_accessor :board, :min, :max

  def initialize
    @board = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @min = 0
    @max = 9
  end

  def show
    board.each do |number|
      if number.between?(min, max)
        print "\e[32m#{number}\e[0m  "
      else
        print "\e[31m#{number}\e[0m  "
      end
    end
    puts ''
  end
end

# Game to find the random number
class NumberGame
  attr_accessor :game_solution, :count, :board

  def initialize
    @game_solution = rand(0..9)
    @board = GameBoard.new
  end

  def play_game
    puts "Let's play 'Find a number like BST'"
    @count = 0
    loop do
      board.show
      guess = verify_input(player_input)
      @count += 1
      break if correct_guess?(guess)

      turn_feedback(guess)
    end
    game_over
  end

  def verify_input(number)
    return number if valid_input?(number)

    puts 'Input error!'
    verify_input(player_input)
  end

  def turn_feedback(guess)
    if guess < game_solution.to_s
      puts "\e[32mGUESS HIGHER\e[0m  "
      board.min = guess.to_i + 1
    else
      puts "\e[32mGUESS LOWER\e[0m  "
      board.max = guess.to_i - 1
    end
  end

  def correct_guess?(number)
    number == game_solution.to_s
  end

  def game_over
    if @count == 1
      puts 'LUCKY GUESS!'
    elsif @count < 4
      puts "Congratulations! You picked the random number in #{@count} guesses!"
    else
      puts "That was hard. It took you #{@count} guesses!"
    end
  end

  protected

  def player_input
    puts 'Choose 1-digit between 0-9'
    gets.chomp
  end

  def valid_input?(input)
    input.match(/^[0-9]$/)
  end
end

game = NumberGame.new
game.play_game

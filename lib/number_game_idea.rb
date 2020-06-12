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
        # print "\e[31m-\e[0m  "
        print '-  '
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
    puts "\nBinary Search Tree Number Game\n\n"
    puts "Choose a number in the middle of the \e[32mgreen range\e[0m"
    @count = 0
    loop do
      board.show
      guess = verify_input(player_input)
      @count += 1
      break if correct_guess?(guess)

      update_board(guess)
    end
    game_over
  end

  def verify_input(number)
    return number if valid_input?(number)

    puts 'Input error!'
    verify_input(player_input)
  end

  def update_board(guess)
    if guess < game_solution.to_s
      board.min = guess.to_i + 1
    else
      board.max = guess.to_i - 1
    end
  end

  def correct_guess?(number)
    number == game_solution.to_s
  end

  def game_over
    if @count == 1
      puts 'LUCKY GUESS!'
    elsif @count <= 4
      puts "Congratulations! You found the random number in #{@count} guesses!"
    else
      puts "It took you #{@count} guesses."
      puts 'Remember BST always picks the middle number in the green range.'
    end
  end

  protected

  def player_input
    puts ''
    difference = board.max - board.min
    if difference > 1
      puts "Enter 1-digit in the middle of \e[32m#{board.min}-#{board.max}\e[0m"
    elsif difference == 1
      puts 'You have a 50% chance to get it right'
      puts "Enter either \e[32m#{board.min}\e[0m or \e[32m#{board.max}\e[0m"
    else
      puts "You've narrowed it down to one possibility."
      puts 'Enter that number to win the game.'
    end
    gets.chomp
  end

  def valid_input?(input)
    input.to_i.between?(board.min, board.max)
  end
end

game = NumberGame.new
game.play_game

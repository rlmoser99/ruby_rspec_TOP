# frozen_string_literal: true

require_relative '../lib/13_game_board'

# Binary Search Tree Number Game
class NumberGame
  attr_accessor :game_solution, :count, :board

  def initialize
    @game_solution = rand(0..9)
    @board = GameBoard.new
  end

  def play_game
    puts instructions
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

    puts "\e[31mInput error!\e[0m"
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
      puts 'Awesome! You should have found the number in 4 or less guesses.'
      puts "To be exact, you found it in #{@count} guesses!"
    else
      puts 'You should have found the number in 4 or less guesses.'
      puts 'Remember to always pick from the middle of the green range.'
      puts "It took you #{@count} guesses."
    end
  end

  protected

  def player_input
    if board.max - board.min > 1
      puts "Enter 1-digit in the middle of \e[32m#{board.min}-#{board.max}\e[0m"
    else
      final_turn_prompts
    end
    gets.chomp
  end

  def final_turn_prompts
    if board.max - board.min == 1
      puts 'You have a 50% chance to get it right'
      puts "Enter either \e[32m#{board.min}\e[0m or \e[32m#{board.max}\e[0m"
    else
      puts "You've narrowed it down to one possibility."
      puts 'Enter that number to win the game.'
    end
  end

  def valid_input?(input)
    input.to_i.between?(board.min, board.max)
  end

  def instructions
    <<~HEREDOC

      \e[32mBinary Search Tree Number Game\e[0m
      Try to find a random number that is between 0 and 9.

      If you choose a number in the middle of the \e[32mgreen range\e[0m,
      you should be able to find the number in 4 or less guesses.


    HEREDOC
  end
end

game = NumberGame.new
game.play_game

# frozen_string_literal: true

# Binary Search Tree Number Game Board
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
        print '-  '
      end
    end
    puts ''
  end
end

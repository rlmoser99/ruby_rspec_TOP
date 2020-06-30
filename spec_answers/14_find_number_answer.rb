# frozen_string_literal: true

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# All answers for this TDD example are in this file (FindNumber class and rspec tests )

# class for computer to find random number
class FindNumber
  attr_accessor :answer, :min, :max, :guess

  def initialize(min, max, answer = RandomNumber.new(min, max))
    @min = min
    @max = max
    @answer = answer
  end

  def make_guess
    (min + max) / 2
  end

  def game_over?
    @guess == answer.value
  end

  def update_range
    guess < answer.value ? @min = guess + 1 : @max = guess - 1
  end
end

# ASSIGNMENT
# This assignment is going to be writing tests & writing code to make those tests pass.

# The basic idea of 'FindNumber' is to program a computer to guess a random_number, using binary search.
# Remember the binary search video that you watched in the Computer Science section
# https://www.youtube.com/watch?v=T98PIp4omUA
# The computer will update min and max values to help find the correct number.

describe FindNumber do
  # ASSIGNMENT: METHOD #1
  describe '#make_guess' do
    subject(:game) { described_class.new(0, 9, random_number) }
    # Create a random_number double & allow it to receive 'value' and return 8 in one of the two ways explained above
    let(:random_number) { double('random_number', value: 8) }

    # Write a test that would expect #make_guess to return the middle number of the min and max values (rounded down)
    context 'when min is 0 and max is 9' do
      it 'returns 4' do
        guess = game.make_guess
        expect(guess).to eq(4)
      end
    end

    # Write a method in 13_find_number.rb called #make_guess that returns the middle number of the min and max values

    # Write a test for each of the following contexts:

    context 'when min is 5 and max is 9' do
      it 'returns 7' do
        game.min = 5
        guess = game.make_guess
        expect(guess).to eq(7)
      end
    end

    context 'when min is 8 and max is 9' do
      it 'returns 8' do
        game.min = 8
        guess = game.make_guess
        expect(guess).to eq(8)
      end
    end

    context 'when min is 0 and max is 3' do
      it 'returns 1' do
        game.max = 3
        guess = game.make_guess
        expect(guess).to eq(1)
      end
    end

    context 'when min and max both equal 3' do
      it 'returns 3' do
        game.min = 3
        game.max = 3
        guess = game.make_guess
        expect(guess).to eq(3)
      end
    end
  end

  # ASSIGNMENT: METHOD #2
  describe '#game_over?' do
    # In a long test file, it can be helpful to declare variables in each describe block, to make the tests more read-able.
    # So create a subject and random_number double & allow it to receive 'value' and return any number from the min - max

    let(:random_number) { double('random_number', value: 3) }
    subject(:game) { described_class.new(0, 9, random_number) }

    # Write a test that would expect game to be_game_over when a guess equals the random_number.value above

    context 'when guess and random_number.value equal' do
      it 'is game over' do
        game.guess = 3
        expect(game).to be_game_over
      end
    end

    # Write a method in 13_find_number.rb called #game_over? that returns true when a guess equals the value of the random_number

    # Write a test that would expect game to NOT be_game_over when a guess does NOT equal the random_number.value above

    context 'when guess and random_number.value does not equal' do
      it 'is not game over' do
        game.guess = 4
        expect(game).to_not be_game_over
      end
    end
  end

  # ASSIGNMENT: METHOD #3
  describe '#update_range' do
    let(:random_number) { double('random_number', value: 8) }
    subject(:game) { described_class.new(0, 9, random_number) }

    # Write a test for #update_range that for each of the following scenerios:
    # 1. If the guess is less than the solution, then the min would update to one more than the guess & max stays the same.
    # 2. If the guess is greater than the solution, then the max would update to one less than the guess & min stays the same.
    # Note: this example game starts off with min = 0 and max = 9 due to the { described_class.new(0, 9, random_number) }

    context 'when the guess is 4' do
      it 'will only update min' do
        game.guess = 4
        game.update_range
        minimum = game.min
        maximum = game.max
        expect(minimum).to eq(5)
        expect(maximum).to eq(9)
      end
    end

    context 'when the guess is 9' do
      it 'will only update max' do
        game.guess = 9
        game.update_range
        minimum = game.min
        maximum = game.max
        expect(minimum).to eq(0)
        expect(maximum).to eq(8)
      end
    end

    # Now, write the method in 13_find_number.rb called #update_range that will do the following:
    # 1. If the guess is less than the solution, then the min would update to one more than the guess
    # 2. If the guess is greater than the solution, then the max would update to one less than the guess

    # Write a test for any 'edge cases' that you can think of, for example:

    context 'when the guess is 7, with min=5 and max=8' do
      it 'will update min to the same value as max' do
        game.min = 5
        game.max = 8
        game.guess = 7
        game.update_range
        minimum = game.min
        maximum = game.max
        expect(minimum).to eq(8)
        expect(maximum).to eq(8)
      end
    end
  end
end

# rubocop:enable Layout/LineLength, Metrics/BlockLength

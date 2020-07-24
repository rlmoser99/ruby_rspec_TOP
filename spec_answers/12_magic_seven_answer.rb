# frozen_string_literal: true

require_relative '../lib/12_magic_seven'

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# Before learning any more complexities to testing, let's take a look at a standard testing
# pattern - Arrange Act, and Assert
# https://youtu.be/sCthIEOaMI8

# 1. Arrange -> set-up the test (for example: initializing objects, let variables, updating
# values of instance variables, etc.)
# 2. Act -> executing the logic to test (for example: calling a method to run)
# 3. Assert -> expect the results of arrange & act

# The tests in this example are fairly easy to understand and may seem ridiculous to use A-A-A
# However, tests should be easily understood by someone that is not familiar with the code.

# NOTE: When you start using A-A-A to format your tests, it will feel counter-intuitive to
# DRY (don't repeat yourself)
# Creating tests that are easy to read is very important, therefore using repetition is neccessary.
# When you start working on a existing code base, you will often become familiar with the code
# by reading the tests.

describe MagicSeven do
  # The next line should be very familiar and it is part of the 'Arrange' step.
  subject(:game) { described_class.new }

  describe '#add_nine' do
    it 'returns 15' do
      # This text could be written like the following (and would pass):
      expect(game.add_nine(6)).to eq(15)

      # However, the above test is NOT very readable. For example, it does not explain where '6' came from.
      # Therefore, let's start with explaining where '6' came from to complete the 'Arrange' step
      random_number = 6

      # For the 'Act' step, we will be testing the result of the logic of adding nine to a random_number
      result = game.add_nine(random_number)

      # For the 'Assert' step, we know exactly we expect the result to be
      expect(result).to eq(15)
    end
  end

  # In addition, using a context to explain the conditions of the test makes the output more read-able
  describe '#multiply_by_two' do
    context 'when the previous step is 8' do
      it 'returns 16' do
        previous_step = 8 # Arrange
        result = game.multiply_by_two(previous_step) # Act
        expect(result).to eq(16) # Assert
      end
    end
  end

  # ASSIGNMENT
  # Write a test for each of the following methods

  describe '#minus_four' do
    context 'when the previous step is 10' do
      it 'returns 6' do
        previous_step = 10
        result = game.minus_four(previous_step)
        expect(result).to eq(6)
      end
    end
  end

  describe '#divide_by_two' do
    context 'when the previous step is 18' do
      it 'returns 9' do
        previous_step = 18
        result = game.divide_by_two(previous_step)
        expect(result).to eq(9)
      end
    end
  end

  # The last method of this 'magic seven' game should always be seven
  describe '#subtract_random_number' do
    context 'when the previous step is 10 and random_number is 3' do
      # remove the 'x' before running this test
      it 'returns 7' do
        # Hint: this test will need to 'arrange' two variables
        previous_step = 10
        game.instance_variable_set(:@random_number, 3)
        result = game.subtract_random_number(previous_step)
        expect(result).to eq(7)
      end
    end
  end

  # The #play method will always return seven
  # Test this game, by using any positive integer as the random_number
  describe '#play' do
    context 'when the random number is 19' do
      # remove the 'x' before running this test
      it 'will always return 7' do
        game.instance_variable_set(:@random_number, 19)
        result = game.play
        expect(result).to eq(7)
      end
    end

    context 'when the random number is 1001' do
      # remove the 'x' before running this test
      it 'will always return 7' do
        game.instance_variable_set(:@random_number, 1001)
        result = game.play
        expect(result).to eq(7)
      end
    end

    context 'when the random number is 987,654,321' do
      # remove the 'x' before running this test
      it 'will always return 7' do
        game.instance_variable_set(:@random_number, 987_654_321)
        result = game.play
        expect(result).to eq(7)
      end
    end
  end
end

# rubocop:enable Layout/LineLength, Metrics/BlockLength

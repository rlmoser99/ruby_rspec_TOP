# frozen_string_literal: true

require_relative '../lib/12_magic_seven'

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# Before learning any more complexities to testing, let's take a look at a standard testing pattern - Arrange Act, and Assert
# https://youtu.be/sCthIEOaMI8

# 1. Arrange -> set-up the test (for example: initializing objects, let variables, updating values of instance variables, etc.)
# 2. Act -> executing the logic to test (for example: calling a method to run)
# 3. Assert -> expect the results of arrange & act

# The tests in this example are fairly easy to understand and may seem ridiculous to use A-A-A
# However, as tests become more complicated, it is important to clearly arrange, act & assert each step clearly.

# NOTE: When you start using A-A-A to format your tests, it will feel counter-intuitive to DRY (don't repeat yourself)
# Creating tests that are easy to read is very important, therefore using repetition is neccessary.
# When you start working on a existing code base, you will often become familiar with the code by reading the tests.

# BOTTOM LINE: Tests should be easily understood by someone that is not familiar with the code.

describe MagicSeven do
  # This next line should be very familiar and it is part of the 'Arrange' step.
  subject(:game) { described_class.new }

  describe '#add_nine' do
    it 'should return 15' do
      # This text could be written like the following (and would pass):
      expect(game.add_nine(6)).to eq(15)

      # However, the above test is NOT very readable. For example, it does not explain where '6' came from.
      # Therefore, let's start with explaining where '6' came from as part of the 'Arrange' step
      random_number = 6

      # For the 'Act' step, we will be testing the result of the logic of adding nine to the random_number
      result = game.add_nine(random_number)

      # For the 'Assert' step, we know exactly what to expect the result to be
      expect(result).to eq(15)
    end
  end

  # Similar test as above, with the A-A-A steps clearly marked
  describe '#multiply_by_two' do
    it 'should return 16' do
      previous_step = 8 # Arrange
      result = game.multiply_by_two(previous_step) # Act
      expect(result).to eq(16) # Assert
    end
  end

  # ASSIGNMENT
  # Write a test for each of the following methods

  describe '#minus_four' do
  end

  describe '#divide_by_two' do
  end

  # The last method of this 'magic seven' game should always be seven
  describe '#subtract_random_number' do
    # remove the 'x' before running this test
    xit 'should return 7' do
      # Hint: this test will need to 'arrange' two variables
    end
  end

  # The result of this 'magic seven' game should always be seven (with any random_number)
  describe '#play' do
    # remove the 'x' before running this test
    xit 'should return 7' do
    end
  end
end

# rubocop:enable Layout/LineLength, Metrics/BlockLength

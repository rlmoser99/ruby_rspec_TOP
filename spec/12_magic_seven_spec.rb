# frozen_string_literal: true

require_relative '../lib/12_magic_seven'

# rubocop:disable Metrics/BlockLength

# Before learning any more complexities to testing, let's take a look at a
# standard testing pattern - Arrange Act, and Assert.
# https://youtu.be/sCthIEOaMI8

# 1. Arrange -> set-up the test (examples: initializing objects, let
#               variables, updating values of instance variables, etc.)
# 2. Act ->     executing the logic to test (example: calling a method to run).
# 3. Assert ->  expect the results of arrange & act.

# The tests in this example are fairly easy to understand and may seem
# ridiculous to use A-A-A. However, tests should be easily understood by
# someone that is not familiar with the code.

# NOTE: When you start using A-A-A to format your tests, it will feel
# counter-intuitive to DRY (don't repeat yourself). Creating tests that are
# easy to read is very important, therefore using repetition is neccessary.
# When you start working on a existing code base, you will often become familiar
# with the code by reading the tests.

describe MagicSeven do
  # This next line should be very familiar and it is part of the 'Arrange' step.
  subject(:game) { described_class.new }

  describe '#add_nine' do
    it 'returns 15' do
      # This text could be written like the following (and would pass):
      expect(game.add_nine(6)).to eq(15)

      # However, the above test is NOT very readable. For example, it does not
      # explain where '6' came from. Therefore, let's start with explaining
      # where '6' came from as part of the 'Arrange' step.
      random_number = 6

      # For the 'Act' step, we will be testing the result of the logic of adding
      # nine to the random_number.
      result = game.add_nine(random_number)

      # For the 'Assert' step, we know exactly what to expect the result to be:
      expect(result).to eq(15)
    end
  end

  # In addition, using a context to explain the conditions of the test makes
  # the output more read-able.
  describe '#multiply_by_two' do
    context 'when the previous step is 8' do
      it 'returns 16' do
        previous_step = 8 # Arrange
        result = game.multiply_by_two(previous_step) # Act
        expect(result).to eq(16) # Asserts
      end
    end
  end

  # ASSIGNMENT
  # Write a test for each of the following methods:

  describe '#subtract_four' do
  end

  describe '#divide_by_two' do
  end

  # The following tests will need you to set the value of the random_number
  describe '#subtract_random_number' do
  end

  # The #play method will always return seven!
  # Test this game, by using any positive integer as the random_number.
  describe '#play' do
    context 'when the random number is ...' do
      # remove the 'x' before running this test
      xit 'will always return 7' do
      end
    end

    context 'when the random number is ...' do
      # remove the 'x' before running this test
      xit 'will always return 7' do
      end
    end

    context 'when the random number is ...' do
      # remove the 'x' before running this test
      xit 'will always return 7' do
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength

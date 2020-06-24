# frozen_string_literal: true

require_relative '../lib/12_magic_seven'

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# Standard Testing Pattern - Arrange Act, and Assert
# https://youtu.be/sCthIEOaMI8

# 1. Arrange -> set-up the test (for example: initializing objects, let variables, updating values of instance variables, etc.)
# 2. Act -> executing the logic to test (for example: calling a method to run)
# 3. Assert -> expect the results of arrange & act

# Warning: When you start using A-A-A to format your tests, it can feel counter-intuitive to DRY (don't repeat yourself)
# Using repetition is unavoidable in read-able tests, which is the project's 'living documention' and should be very explicit.

describe MagicSeven do
  subject(:game) { described_class.new } # Arrange

  describe '#add_nine' do
    it 'should return 10' do
      # THIS IS ACTUALLY THE RANDOM NUMBER? BUT SHOULDN'T MATTER
      input = 1 # Arrange
      result = game.add_nine(input) # Act
      expect(result).to eq(10) # Assert
    end
  end

  describe '#multiply_by_two' do
    it 'should return 16' do
      previous_step = 8 # Arrange
      result = game.multiply_by_two(previous_step) # Act
      expect(result).to eq(16) # Assert
    end
  end

  describe '#minus_four' do
    it 'should return 6' do
      # Arrange
      previous_step = 10
      # Act
      result = game.minus_four(previous_step)
      # Assert
      expect(result).to eq(6)
    end
  end

  describe '#divide_by_two' do
    it 'should return 6' do
      # Arrange
      previous_step = 18
      # Act
      result = game.divide_by_two(previous_step)
      # Assert
      expect(result).to eq(9)
    end
  end

  describe '#subtract_original' do
    it 'should return 7' do
      # Arrange
      game.random_number = 3
      previous_step = 10
      # Act
      result = game.subtract_random_number(previous_step)
      # Assert
      expect(result).to eq(7)
    end
  end
end

# rubocop:enable Layout/LineLength, Metrics/BlockLength

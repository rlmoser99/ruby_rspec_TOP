# frozen_string_literal: true

require_relative '../lib/magic_seven'

# Arrange-Act-Assert is a to format each test.
# http://www.chrisrolle.com/en/blog/testing-arrange-act-assert
# https://youtu.be/sCthIEOaMI8

# 1. Arrange -> set-up the test (for example: initializing objects, let variables, updating values of instance variables, etc.)
# 2. Act -> executing the logic to test (for example: calling a method to run)
# 3. Assert -> expect the results of arrange & act

# Warning: When you start using A-A-A to format your tests, it can feel counter-intuitive to DRY (don't repeat yourself)
# Using repetition is unavoidable in read-able tests, which is the project's 'living documention' and should be very explicit.

describe MagicSeven do
  # Arrange
  subject(:game) { described_class.new }

  describe '#add_nine' do
    it 'should return 10' do
      # Arrange
      previous_step = 1
      # Act
      result = game.add_nine(previous_step)
      # Assert
      expect(result).to eq(10)
    end
  end

  describe '#multiply_by_two' do
    it 'should return 16' do
      # Arrange
      previous_step = 8
      # Act
      result = game.multiply_by_two(previous_step)
      # Assert
      expect(result).to eq(16)
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

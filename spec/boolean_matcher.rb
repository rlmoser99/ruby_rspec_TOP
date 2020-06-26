# frozen_string_literal: true

# http://testing-for-beginners.rubymonstas.org/rspec/matchers.html

# using method_name? to write a test for it.
# Change files -> 13, 14, 15

# example class to test predicate methods
class NumberGame
  attr_accessor :solution, :guess

  def initialize
    @solution = rand(0..9)
  end

  def correct_guess?(number)
    number == solution.to_s
  end

  def correct?
    guess == solution.to_s
  end
end

describe NumberGame do
  subject(:game) { described_class.new }

  describe '#correct?' do
    context 'when number is correct' do
      it 'should return true' do
        game.solution = 5
        game.guess = '5'
        expect(game).to be_correct
      end
    end

    context 'when number is not correct' do
      it 'should return false' do
        game.solution = 3
        game.guess = '5'
        expect(game).to_not be_correct
      end
    end
  end

  describe '#correct_guess?' do
    context 'when user guess is correct' do
      it 'should return true' do
        game.solution = 5
        user_guess = '5'
        correct = game.correct_guess?(user_guess)
        expect(correct).to be true
      end
    end

    context 'when user guess is not correct' do
      it 'should return false' do
        game.solution = 5
        user_guess = '3'
        correct = game.correct_guess?(user_guess)
        expect(correct).to be false
      end
    end
  end
end

# frozen_string_literal: true

require_relative '../lib/15_binary_search'
require_relative '../lib/15_random_number'

describe BinarySearch do
  describe '#make_guess' do
    subject(:game) { described_class.new(0, 9, 8) }

    context 'when min is 0 and max is 9' do
      it 'returns 4' do
        guess = game.make_guess
        expect(guess).to eq(4)
      end
    end

    context 'when min is 5 and max is 9' do
      it 'returns 7' do
        game.instance_variable_set(:@min, 5)
        guess = game.make_guess
        expect(guess).to eq(7)
      end
    end

    context 'when min is 8 and max is 9' do
      it 'returns 8' do
        game.instance_variable_set(:@min, 8)
        guess = game.make_guess
        expect(guess).to eq(8)
      end
    end

    context 'when min is 0 and max is 3' do
      it 'returns 1' do
        game.instance_variable_set(:@max, 3)
        guess = game.make_guess
        expect(guess).to eq(1)
      end
    end

    context 'when min and max both equal 3' do
      it 'returns 3' do
        game.instance_variable_set(:@min, 3)
        game.instance_variable_set(:@max, 3)
        guess = game.make_guess
        expect(guess).to eq(3)
      end
    end
  end

  describe '#game_over?' do
    subject(:ending_game) { described_class.new(0, 9, 3) }

    context 'when guess and random_number are equal' do
      it 'is game over' do
        ending_game.instance_variable_set(:@guess, 3)
        expect(ending_game).to be_game_over
      end
    end

    context 'when guess and random_number are not equal' do
      it 'is not game over' do
        ending_game.instance_variable_set(:@guess, 4)
        expect(ending_game).to_not be_game_over
      end
    end
  end

  describe '#update_range' do
    subject(:updating_game) { described_class.new(0, 9, 8) }

    context 'when the guess is less than the answer' do
      before do
        updating_game.instance_variable_set(:@guess, 4)
        updating_game.update_range
      end

      it 'updates min' do
        minimum = updating_game.min
        expect(minimum).to eq(5)
      end

      it 'does not update max' do
        maximum = updating_game.max
        expect(maximum).to eq(9)
      end
    end

    context 'when the guess is more than the answer' do
      before do
        updating_game.instance_variable_set(:@guess, 9)
        updating_game.update_range
      end

      it 'does not update min' do
        minimum = updating_game.min
        expect(minimum).to eq(0)
      end

      it 'updates max' do
        maximum = updating_game.max
        expect(maximum).to eq(8)
      end
    end

    context 'when the guess is 7, with min=5 and max=8' do
      before do
        updating_game.instance_variable_set(:@min, 5)
        updating_game.instance_variable_set(:@max, 8)
        updating_game.instance_variable_set(:@guess, 7)
        updating_game.update_range
      end

      it 'updates min to the same value as max' do
        minimum = updating_game.min
        expect(minimum).to eq(8)
      end

      it 'does not update max' do
        maximum = updating_game.max
        expect(maximum).to eq(8)
      end
    end
  end
end

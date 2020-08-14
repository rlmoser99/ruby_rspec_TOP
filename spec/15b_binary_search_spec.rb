# frozen_string_literal: true

require_relative '../lib/15b_binary_search'

# DOES THIS NEED TO BE REVISITED???

# The file order to complete this lesson:

# 1. Familarize yourself with the three lib/15 files.
#    - lib/15a_binary_game
#    - lib/15b_binary_search which is based on 14_find_number
#    - lib/15c_random_numer
# 2. Look at spec/15b_binary_search_spec which is based on 14_find_number_spec
# 3. Complete spec/15a_binary_game_spec

# This spec file is for the BinarySearch class that is used by the BinaryGame
# class. These tests were written in the last lesson. The FindNumber class
# has been renamed to BinarySearch, which is a more accurate description.
# Note that BinaryGame is going to let the user decide between inputting a
# random number and having the computer generate one using the
# RandomNumber class. This means that the RandomNumber double is no longer
# needed for this spec file.

describe BinarySearch do
  describe '#make_guess' do
    let(:random_number) { double('random_number', value: 8) }
    subject(:game) { described_class.new(0, 9, random_number) }

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
    let(:ending_number) { double('random_number', value: 3) }
    subject(:ending_game) { described_class.new(0, 9, ending_number) }

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
    let(:updating_number) { double('random_number', value: 8) }
    subject(:updating_game) { described_class.new(0, 9, updating_number) }

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

# frozen_string_literal: true

require_relative '../lib/15_binary_search'
require_relative '../lib/15_random_number'
require_relative '../lib/15_binary_game'

describe BinaryGame do
  subject(:game) { described_class.new }

  describe '#max_guesses' do
    context 'when the range is default (1 - 100)' do
      it 'is 7 guesses' do
        max_guesses = game.max_guesses
        expect(max_guesses).to be(7)
      end
    end

    context 'when the range is 1 - 200' do
      it 'is 8 guesses' do
        game.instance_variable_set(:@range, [1, 200])
        max_guesses = game.max_guesses
        expect(max_guesses).to be(8)
      end
    end
  end

  describe '#user_random' do
    it 'creates a new BinarySearch' do
      allow(game).to receive(:verify_input).and_return(42)
      allow(game).to receive(:player_input).and_return(42)
      expect(BinarySearch).to receive(:new).with(1, 100, 42)
      game.user_random
    end
  end

  describe '#computer_random' do
    let(:computer_number) { instance_double('random_number', value: 79) }

    it 'creates a new RandomNumber' do
      expect(RandomNumber).to receive(:new).with(1, 100).and_return(computer_number)
      allow(game).to receive(:puts)
      allow(BinarySearch).to receive(:new)
      game.computer_random
    end

    it 'creates a new BinarySearch' do
      allow(RandomNumber).to receive(:new).with(1, 100).and_return(computer_number)
      allow(game).to receive(:puts)
      expect(BinarySearch).to receive(:new).with(1, 100, 79)
      game.computer_random
    end
  end
end

# frozen_string_literal: true

require_relative '../lib/15_binary_search'
require_relative '../lib/15_random_number'
require_relative '../lib/15_binary_game'

# The files for this example (#15) build on the TDD files from #14.
# The FindNumber class is now called BinarySearch, which is a more accurate
# description.

# In addition, this example now includes a BinaryGame class. This class is
# going to let the user decide to input a random number or have the computer
# generate one (using the RandomNumber class). Therefore, the RandomNumber
# double from the previous file has been removed.

# After TDD is complete, the classes and methods that were used as a test
# double should be updated to be a 'verifying double.' Using a 'verifying
# double' is preferred, because doubles can produce an error if they do
# not exist in the actual class.

# https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/verifying-doubles

# It is common for method and variable names to change during development.
# For example, random_number.value could change to rand_num.number

# Therefore using a 'verifying double' makes a test more stable.

# Unit testing relies on using doubles to test the object in isolation (i.e.,
# not dependent on any other object). One important concept to understand is
# that the BinarySearch or FindNumber class doesn't care if it is given an\
# actual random_number class object. It only cares that it is given an object
# that can respond to certain methods. This concept is called polymorphism.
# https://www.geeksforgeeks.org/polymorphism-in-ruby/

# In the file, 14_find_number, you wrote tests for #make_guess, #game_over?, and
# #update_range. We will not re-write them for this example. If you'd like to
# see them again, they are now in 15_binary_search_spec.rb (without doubles).

describe BinaryGame do
  describe '#max_guesses' do
    subject(:max_game) { described_class.new }

    context 'when the range is default (1 - 100)' do
      it 'is 7 guesses' do
        max_guesses = max_game.max_guesses
        expect(max_guesses).to be(7)
      end
    end

    context 'when the range is 1 - 200' do
      it 'is 8 guesses' do
        max_game.instance_variable_set(:@range, [1, 200])
        max_guesses = max_game.max_guesses
        expect(max_guesses).to be(8)
      end
    end

    context 'when the range is 1 - 300' do
      xit 'is 9 guesses' do
      end
    end
  end

  describe '#user_random' do
    subject(:user_game) { described_class.new }

    it 'creates a new BinarySearch' do
      allow(user_game).to receive(:verify_input).and_return(42)
      allow(user_game).to receive(:player_input).and_return(42)
      expect(BinarySearch).to receive(:new).with(1, 100, 42)
      user_game.user_random
    end
  end

  describe '#computer_random' do
    subject(:computer_game) { described_class.new }
    let(:computer_number) { instance_double(RandomNumber, value: 79) }

    it 'creates a new RandomNumber' do
      expect(RandomNumber).to receive(:new).with(1, 100).and_return(computer_number)
      allow(computer_game).to receive(:puts)
      allow(BinarySearch).to receive(:new)
      computer_game.computer_random
    end

    xit 'creates a new BinarySearch' do
    end
  end

  describe '#computer_turns' do
    subject(:turns_game) { described_class.new }
    let(:turns_search) { instance_double(BinarySearch) }

    before do
      turns_game.instance_variable_set(:@search, turns_search)
      allow(turns_game).to receive(:puts)
      allow(turns_game).to receive(:max_guesses)
      allow(turns_game).to receive(:display_range)
    end

    after { turns_game.computer_turns }

    context 'when first guess is correct' do
      before do
        allow(turns_game.search).to receive(:game_over?).and_return(true)
        allow(turns_game.search).to receive(:make_guess).and_return(50)
      end

      it 'sends make_guess once' do
        expect(turns_game.search).to receive(:make_guess).once
      end

      it 'does not send update_range' do
        allow(turns_game.search).to receive(:make_guess)
        expect(turns_game.search).not_to receive(:update_range)
      end
    end

    context 'when second guess is correct' do
      before do
      end

      xit 'sends make_guess twice' do
      end

      xit 'sends update_range once' do
      end
    end
  end
end

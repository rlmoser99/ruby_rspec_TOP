# frozen_string_literal: true

require_relative '../lib/15a_binary_game'
require_relative '../lib/15b_binary_search'
require_relative '../lib/15c_random_number'

# The file order to complete this lesson:

# 1. Familarize yourself with the four lib/15 files.
#    - lib/15_binary_main
#    - lib/15a_binary_game
#    - lib/15b_binary_search which is based on 14_find_number
#    - lib/15c_random_numer
# 2. Read the comments in spec/15b_binary_search_spec
# 3. Complete spec/15a_binary_game_spec

# As noted above, the files for this lesson (#15) build on the TDD files
# from #14. The FindNumber class is now called BinarySearch, which is a more
# accurate description.

# This lesson has a new class called BinaryGame. This BinaryGame class uses
# the BinarySearch class and visualizes how a binary search works.

# The focus of this lesson is unit testing, which is testing the behavior of individual methods in isolation.
# However, every method does not need to be tested, so we will look at some basic guidelines that determine whether or not a method needs to be tested.
# https://www.artofunittesting.com/definition-of-a-unit-test

# In general, you probably have 3 types of methods:
# 1. Command - Methods that performs an action and/or has a side effect.
# 2. Query - Methods that returns a value.
# 3. Script - Methods that call other methods, usually in a specific order.

# Methods that should be tested
# 1. Public Command Method
# 2. Public Query Method
# 3. Command Method called inside a Script Method
# 4. Query Method called inside a Script Method
# 5. Any Method with an Outgoing Command

# Testing methods that are public is essential, but this also extends to methods that are inside a script. For the games that we are making, script methods are just a convenient way to call the methods needed to play a full game. Since these methods that are needed to play the game, they should be publicly tested methods (even if you previously made them private because they are not technically called outside of the class).

# Any Method with an Outgoing Command is any method that sends a command message to another class.

# There are 3 different tests to write, depending the type of method. Here is a summary of what should be tested, according to each method type.
# 1. Command Method -> Test the action/side effect
# 2. Query Method -> Test the return value
# 3. Method with Outgoing Command -> Test that a message is sent

# There are a handful of methods that you do not need to test.
# 1. You do not have to test #initialize if it is only creating instance variables. However, if you call methods inside the initialize method, you might need to test #initialize and/or the inside methods. In addition, you will need to stub the inside method because it will be called when you create an instance of the class.

# 2. Methods that only contain 'puts' or 'gets' because they are well-tested in the standard ruby library.

# 3. Private methods do not need to be tested because they should have test coverage in public methods. (However, as previously discussed, you may have some private methods that are called inside a script method, that should be tested.)

describe BinaryGame do
  subject(:game) { described_class.new(1, 10) }

  describe '#player_input' do
    context 'when user input is between parameters' do
      it 'returns user input' do
        user_input = '4'
        allow(game).to receive(:gets).and_return(user_input)
        result = game.player_input(1, 10)
        expect(result).to eq(4)
      end
    end

    context 'when first user input is not between parameters' do
      it 'returns second user input' do
        letter_input = 'r'
        user_input = '9'
        allow(game).to receive(:gets).and_return(letter_input, user_input)
        allow(game).to receive(:puts).once
        result = game.player_input(1, 10)
        expect(result).to eq(9)
      end
    end
    context 'when first and second user input is not between parameters' do
      it 'returns third user input' do
        letter_input = 'r'
        symbol_input = '$'
        user_input = '6'
        allow(game).to receive(:gets).and_return(letter_input, symbol_input, user_input)
        allow(game).to receive(:puts).twice
        result = game.player_input(1, 10)
        expect(result).to eq(6)
      end
    end
  end

  # ADD CLASS ENCAPSULATION EXPLANATION
  describe '#update_random_number' do
    context 'when updating value of random number' do
      let(:random_update) { instance_double(RandomNumber) }

      before do
        game.instance_variable_set(:@random_number, random_update)
        allow(game).to receive(:puts)
        new_number = 76
        allow(game).to receive(:player_input).with(1, 10).and_return(new_number)
        allow(random_update).to receive(:update_value).with(new_number)
      end

      it 'sends update_value to random_number' do
        expect(random_update).to receive(:update_value).with(76)
        game.update_random_number
      end
    end
  end

  describe '#maximum_guesses' do
    context 'when minimum = 1 and maximum = 10' do
      it 'returns 4' do
        max = game.maximum_guesses
        expect(max).to eq(4)
      end
    end

    context 'when minimum = 1 and maximum = 100' do
      it 'returns 7' do
        game.instance_variable_set(:@maximum, 100)
        max = game.maximum_guesses
        expect(max).to eq(7)
      end
    end

    context 'when minimum = 100 and maximum = 500' do
      it 'returns 9' do
        game.instance_variable_set(:@minimum, 100)
        game.instance_variable_set(:@maximum, 600)
        max = game.maximum_guesses
        expect(max).to eq(9)
      end
    end
  end

  describe '#display_binary_search' do
    # NEW TEST -> TEST THAT BINARYSEARCH RECEIVES NEW
    before do
      allow(game).to receive(:display_range)
      allow(game).to receive(:puts)
    end

    context 'when first guess is correct' do
      let(:first_search) { instance_double(BinarySearch, min: 1, max: 10, guess: 5, make_guess: 5) }

      before do
        allow(first_search).to receive(:game_over?).and_return(true)
        allow(BinarySearch).to receive(:new).and_return(first_search)
      end

      it 'sends make_guess once' do
        expect(first_search).to receive(:make_guess).once
        game.display_binary_search
      end

      it 'does not send update_range' do
        expect(first_search).not_to receive(:update_range)
        game.display_binary_search
      end
    end

    context 'when second guess is correct' do
      let(:second_search) { instance_double(BinarySearch, min: 1, max: 10, guess: 5, make_guess: 5) }

      before do
        allow(second_search).to receive(:update_range)
        allow(second_search).to receive(:game_over?).and_return(false, true)
        allow(BinarySearch).to receive(:new).and_return(second_search)
      end

      it 'sends make_guess twice' do
        expect(second_search).to receive(:make_guess).twice
        game.display_binary_search
      end

      it 'send update_range once' do
        expect(second_search).to receive(:update_range).once
        game.display_binary_search
      end
    end
  end
end

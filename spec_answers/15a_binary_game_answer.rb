# frozen_string_literal: true

require_relative '../lib/15a_binary_game'
require_relative '../lib/15b_binary_search'
require_relative '../lib/15c_random_number'

# The file order to complete this lesson:

# 1. Familarize yourself with the four lib/15 files.
#    - lib/15_binary_main
#    - lib/15a_binary_game
#    - lib/15b_binary_search (which is based on 14_find_number)
#    - lib/15c_random_numer
# 2. Read the comments in spec/15b_binary_search_spec
# 3. Complete spec/15a_binary_game_spec

# As noted above, the files for this lesson (#15) build on the TDD files
# from #14. The FindNumber class is now called BinarySearch, which is a more
# accurate description.

# This lesson has a new class called BinaryGame. This BinaryGame class uses
# the BinarySearch class and visualizes how a binary search works.

# The focus of this lesson is unit testing and will provide general guidelines on determining what methods need to be tested.

# In general, you have 3 types of methods:
# 1. Command - These are methods that performs an action and/or has a side effect
# 2. Query - These are methods that returns a value.
# 3. Script - These are methods that call other methods, usually in a specific order.

# Methods that need to be tested:
# 1. Public Command Method
# 2. Public Query Method
# 3. Command Method inside a Public Script Method
# 4. Query Method inside a Public Script Method
# 5. Any method that sends a command message to another class.

# EXPLAIN 3 & 4 -> LOOK AT TIMATO'S RESPONSE FOR IDEAS
# WHAT ABOUT PRIVATE LOOPING SCRIPT METHODS???

# There are a handful of methods that you do not need to test.
# 1. You do not need to test #initialize if it is only creating instance variables. This can cause the test to be fragile, breaking anytime an instance variable name is changed. If you choose to call methods inside the initialize method, you will need to stub each method for every instance in the tests.

# 2. Methods that only contain 'puts' or 'gets' because they are well-tested in the standard ruby library.

# 3. Private methods do not need to be tested because they should have test coverage in public methods

# Test behaviours, not implementation.
# Unit testing is understood as testing small parts of the code in isolation, e.g. testing some class’s methods, maybe using some stubs/mocks to strip dependencies.
# private methods will be tested through public entry points. Once again, unit testing is not about testing every method in isolation.

# Unit Testing Summary
# Incoming Query -> Assert the result
# Incoming Command -> Assert the direct public side effects
# Outgoing Command -> Expect to send

# INSERT -> SCRIPT EXPLANATION

# In addition, you do not need to test #initialize if it is only creating
# instance variables. This can cause the test to be fragile, breaking anytime
# an instance variable name is changed. If you choose to call methods inside the
# initialize method, you will need to stub each method for every instance in the
# tests.

# That leaves ??? methods to test

describe BinaryGame do
  # let(:binary_search) { instance_double(BinarySearch) }
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

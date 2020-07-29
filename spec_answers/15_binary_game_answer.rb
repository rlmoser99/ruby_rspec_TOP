# frozen_string_literal: true

require_relative '../lib/15_binary_search'
require_relative '../lib/15_random_number'
require_relative '../lib/15_binary_game'

# The files for this example (#15) builds on the TDD files from #14.
# The FindNumber class is now called BinarySearch, which is a more accurate
# description (lib/15_binary_search).

# This example has a new class called BinaryGame. This BinaryGame class is going
# to use the BinarySearch class. In addition, BinaryGame is going to let the
# user decide to input a random number or have the computer generate one (using
# the RandomNumber class). Therefore, the RandomNumber double is no longer
# needed for the BinarySearch spec file. The tests for FindNumber have been
# updated (spec/15_binary_search).

# For this example, we are going to focus on writing unit tests. It is
# recommended to watch the video of a talk called 'Magic Tricks of Testing'
# by Sandi Metz to learn more.
# https://youtu.be/URSWYvyc42M

# Unit Testing Summary
# Incoming Query ->         Assert the result
# Incoming Command ->       Assert the direct public side effects
# Sent to Self Query ->     Ignore
# Sent to Self Command ->   Ignore
# Outgoing Query ->         Ignore
# Outgoing Command ->       Expect to send

# The majority of BinaryGame methods are 'sent to self', therefore we can ignore
# them for unit testing.

# In addition, you do not need to test #initialize if it is only creating
# instance variables. This can cause the test to be fragile, breaking anytime
# an instance variable name is changed. If you choose to call methods inside the
# initialize method, you will need to stub each method for every instance in the
# tests.

# That leaves 4 methods to test - #start, #user_random, #computer_random, and
# #computer_turns.

describe BinaryGame do
  # Incoming Command -> Assert the direct public side effects
  describe '#start' do
    context 'when user chooses the random number' do
      subject(:start_user_game) { described_class.new }

      # To 'Arrange' this test, each of the methods will need to be stubbed, so
      # that they do not execute. The only method that needs a return value is
      # #game_mode_selection, which creates the scenario of this test (explained
      # in context).

      before do
        allow(start_user_game).to receive(:game_instructions)
        allow(start_user_game).to receive(:game_mode_selection).and_return(1)
        allow(start_user_game).to receive(:mode_input)
        allow(start_user_game).to receive(:user_random)
        allow(start_user_game).to receive(:computer_turns)
      end

      # To test if these methods are called, we will be using message
      # expectations.
      # https://relishapp.com/rspec/rspec-mocks/docs

      # To set a message expectation, move 'Assert' before 'Act'.

      it 'calls game instructions' do
        expect(start_user_game).to receive(:game_instructions)
        start_user_game.start
      end

      it 'calls user_random' do
        expect(start_user_game).to receive(:user_random)
        start_user_game.start
      end

      it 'calls computer_turns' do
        expect(start_user_game).to receive(:computer_turns)
        start_user_game.start
      end
    end

    # ASSIGNMENT #1
    context 'when user chooses a computer-generated random number' do
      subject(:start_random_game) { described_class.new }

      before do
        allow(start_random_game).to receive(:game_instructions)
        allow(start_random_game).to receive(:game_mode_selection).and_return(2)
        allow(start_random_game).to receive(:computer_random)
        allow(start_random_game).to receive(:computer_turns)
      end

      it 'calls game instructions' do
        expect(start_random_game).to receive(:game_instructions)
        start_random_game.start
      end

      it 'calls computer_random' do
        expect(start_random_game).to receive(:computer_random)
        start_random_game.start
      end

      it 'calls computer_turns' do
        expect(start_random_game).to receive(:computer_turns)
        start_random_game.start
      end
    end
  end

  # Outgoing Command -> Expect to send
  describe '#computer_random' do
    # After TDD is complete, the classes and methods that were used as a test
    # double should be updated to be a 'verifying double.' Using a 'verifying
    # double' is preferred, because doubles can produce an error if they do
    # not exist in the actual class.
    # https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/verifying-doubles

    # It is common for method and variable names to change during development.
    # For example, random_number.value could change to rand_num.number.

    # Therefore using a 'verifying double' makes a test more stable.

    # Unit testing relies on using doubles to test the object in isolation
    # (i.e., not dependent on any other object). One important concept to
    # understand is that the BinarySearch or FindNumber class doesn't care if it
    # is given an actual random_number class object. It only cares that it is
    # given an object that can respond to certain methods. This concept is
    # called polymorphism.
    # https://www.geeksforgeeks.org/polymorphism-in-ruby/

    # Below is the previous generic 'random_number' object used in TDD and the
    # new verifying instance_double for the RandomNumber class.
    # let(:random_number) { double('random_number', value: 8) }
    let(:computer_number) { instance_double(RandomNumber, value: 79) }
    subject(:computer_game) { described_class.new }

    context 'when user chooses a computer-generated random number' do
      # The RandomNumber #new stub will need to return the 'computer_number'
      # double created above.
      before do
        allow(RandomNumber).to receive(:new).with(1, 100).and_return(computer_number)
        allow(computer_game).to receive(:puts)
        allow(BinarySearch).to receive(:new)
      end

      it 'creates a new RandomNumber' do
        expect(RandomNumber).to receive(:new).with(1, 100).and_return(computer_number)
        computer_game.computer_random
      end

      it 'creates a new BinarySearch' do
        expect(BinarySearch).to receive(:new).with(1, 100, 79)
        computer_game.computer_random
      end
    end
  end

  # ASSIGNMENT #2

  # Outgoing Command -> Expect to send
  describe '#user_random' do
    # Create a subject to use to test #user_random.
    subject(:user_game) { described_class.new }

    context 'when user chooses the random number' do
      # Look at #user_random and determine any methods need to be stubbed and if
      # any methods should return anything.

      before do
        allow(user_game).to receive(:random_number_input).and_return(42)
        allow(user_game).to receive(:player_input)
      end

      it 'creates a new BinarySearch' do
        expect(BinarySearch).to receive(:new).with(1, 100, 42)
        user_game.user_random
      end
    end
  end

  # Outgoing Command -> Expect to send
  describe '#computer_turns' do
    context 'when first guess is correct' do
      subject(:first_game) { described_class.new }
      let(:first_search) { instance_double(BinarySearch) }

      before do
        first_game.instance_variable_set(:@binary_search, first_search)
        allow(first_game).to receive(:puts)
        allow(first_game).to receive(:max_guesses)
        allow(first_game).to receive(:display_range)
        allow(first_game.binary_search).to receive(:game_over?).and_return(true)
        allow(first_game.binary_search).to receive(:make_guess).and_return(50)
        allow(first_game.binary_search).to receive(:make_guess).once
      end

      it 'sends make_guess once' do
        expect(first_game.binary_search).to receive(:make_guess).once
        first_game.computer_turns
      end

      it 'does not send update_range' do
        expect(first_game.binary_search).not_to receive(:update_range)
        first_game.computer_turns
      end
    end

    # ASSIGNMENT #3
    context 'when second guess is correct' do
      # Set up a scenario for two guesses. Not only will the return values need
      # to be changed, but there will also be another method to be stubbed.
      subject(:second_game) { described_class.new }
      let(:second_search) { instance_double(BinarySearch) }

      before do
        second_game.instance_variable_set(:@binary_search, second_search)
        allow(second_game).to receive(:puts)
        allow(second_game).to receive(:max_guesses)
        allow(second_game).to receive(:display_range)
        allow(second_game.binary_search).to receive(:make_guess).and_return(50, 25)
        allow(second_game.binary_search).to receive(:game_over?).and_return(false, true)
        allow(second_game.binary_search).to receive(:make_guess).twice
        allow(second_game.binary_search).to receive(:update_range).once
      end

      it 'sends make_guess twice' do
        expect(second_game.binary_search).to receive(:make_guess).twice
        second_game.computer_turns
      end

      it 'sends update_range once' do
        expect(second_game.binary_search).to receive(:update_range).once
        second_game.computer_turns
      end
    end
  end
end

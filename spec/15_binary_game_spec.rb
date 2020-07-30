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

      # Using method expectations can be confusing. Stubbing the methods above
      # does not cause this test to pass, it only 'allows' a method to be
      # called, if it is called. To test this, let's allow a method that is not
      # called in #start. Uncomment and move the following line to the before
      # hook and run the tests. All of the tests should continue to pass.
      # allow(start_user_game).to receive(:display_range)

      it 'calls user_random' do
        expect(start_user_game).to receive(:user_random)
        start_user_game.start
      end

      it 'calls computer_turns' do
        expect(start_user_game).to receive(:computer_turns)
        start_user_game.start
      end

      # Now choose one of these methods used above as a message expectation and
      # comment it out in the lib/15_binary_game.rb file. Resave the file and
      # rerun the tests. The test of the method that you commented out should
      # fail because that method is never called.

      # Before moving on, uncomment that method in the lib/15_binary_game.rb
      # file to have all tests passing again.
    end

    # ASSIGNMENT #1
    context 'when user chooses a computer-generated random number' do
      # Create a new subject for this scenario.

      # The before hook will be similar to the above test, except the return
      # value of #game_mode_selection should be 2.
      before do
      end

      xit 'calls game instructions' do
      end

      xit 'calls computer_random' do
      end

      xit 'calls computer_turns' do
      end
    end
  end

  # Outgoing Command -> Expect to send
  describe '#computer_random' do
    # After TDD is complete, the classes and methods that were used as a test
    # double should be updated to be a 'verifying double.' Using a 'verifying
    # double' is preferred, because doubles can produce an error if they do
    # not exist in the actual class. Therefore using a 'verifying double'
    # makes a test more stable.
    # https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/verifying-doubles

    # Unit testing relies on using doubles to test the object in isolation
    # (i.e., not dependent on any other object). One important concept to
    # understand is that the BinarySearch or FindNumber class doesn't care if it
    # is given an actual random_number class object. It only cares that it is
    # given an object that can respond to certain methods. This concept is
    # called polymorphism.
    # https://www.geeksforgeeks.org/polymorphism-in-ruby/

    # Below is the previous generic 'random_number' object used in TDD so that
    # you can compare it to the new verifying instance_double for the
    # RandomNumber class.
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
    # Create a new subject to test #user_random. When only one scenario is
    # needed to test a method, the subject can be created in outside of the
    # context block.

    context 'when user chooses the random number' do
      # Look at #user_random and determine any methods need to be stubbed and if
      # any methods should return anything.
      before do
      end

      xit 'creates a new BinarySearch' do
      end
    end
  end

  # Outgoing Command -> Expect to send
  describe '#computer_turns' do
    context 'when first guess is correct' do
      # This method uses the BinarySearch class, so let's create a double to
      # continue to test the BinaryGame class in isolation from other classes.
      let(:first_search) { instance_double(BinarySearch) }
      subject(:first_game) { described_class.new }

      before do
        # Unlike the #computer_random example, where RandomNumber.new returns a
        # double, this method needs the value of the instance variable
        # @binary_search to be set to the double created above.
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

      before do
      end

      xit 'sends make_guess twice' do
      end

      xit 'sends update_range once' do
      end
    end
  end
end

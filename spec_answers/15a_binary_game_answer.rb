# frozen_string_literal: true

require_relative '../lib/15a_binary_game'
require_relative '../lib/15b_binary_search'
require_relative '../lib/15c_random_number'

# The file order to complete this lesson:

# 1. Familarize yourself with the three lib/15 files.
#    - lib/15a_binary_game
#    - lib/15b_binary_search which is based on 14_find_number
#    - lib/15c_random_numer
# 2. Look at spec/15b_binary_search_spec which is based on 14_find_number_spec
# 3. Complete spec/15a_binary_game_spec

# As noted above, the files for this lesson (#15) build on the TDD files
# from #14. The FindNumber class is now called BinarySearch, which is a more
# accurate description.

# This lesson has a new class called BinaryGame. This BinaryGame class uses
# the BinarySearch class. In addition, BinaryGame lets the user decide whether
# to input a random number or have the computer generate one (using
# the RandomNumber class). This means that the RandomNumber double is no longer
# needed for the BinarySearch spec file. The tests for FindNumber have been
# updated (spec/15b_binary_search).

# For this lesson, we are going to focus on writing unit tests. Start by
# watching the video linked below, of a talk called 'Magic Tricks of Testing'
# by Sandi Metz, to learn more.
# https://youtu.be/URSWYvyc42M

# Now that you have seen the video, the below summary should look familiar.
# We will refer to it to determine what to test in this lesson.

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

# UPDATE: Do not test #start, instead ->
# Test: #mode_selection, #user_random, #find_random_number, #create_binary_search,
# and #binary_search_guesses

describe BinaryGame do
  # Incoming Command -> Assert the direct public side effects
  describe '#mode_selection' do
    subject(:game_mode) { described_class.new }

    # To 'Arrange' this test, each of the methods will need to be stubbed, so
    # that they do not execute. The only method that needs a return value is
    # #mode_input, which is also the return value of this method.

    before do
      allow(game_mode).to receive(:introduction)
      allow(game_mode).to receive(:mode_choices)
      user_input = 1
      allow(game_mode).to receive(:mode_input).and_return(user_input)
    end

    it 'returns user input' do
      result = game_mode.mode_selection
      expect(result).to eq(1)
    end
  end

  describe '#find_random_number' do
    subject(:game_find) { described_class.new }

    before do
      allow(game_find).to receive(:display_starting_numbers)
      allow(game_find).to receive(:create_binary_search)
      allow(game_find).to receive(:binary_search_guesses).and_return(55)
    end

    it 'returns random number' do
      result = game_find.find_random_number
      expect(result).to eq(55)
    end
  end

  describe '#find_random_number' do
    subject(:number_game) { described_class.new }
    let(:number_search) { instance_double(BinarySearch, guess: 50, answer: 50, min: 1, max: 100, make_guess: 50, game_over?: true) }

    before do
      number_game.instance_variable_set(:@binary_search, number_search)
      allow(number_game).to receive(:display_starting_numbers)
      allow(number_game).to receive(:display_range)
      allow(number_game).to receive(:create_binary_search).and_return(number_search)
    end

    it 'returns random number' do
      result = number_game.find_random_number
      expect(result).to eq(50)
    end
  end

  # Incoming Command -> Assert the direct public side effects
  # describe '#create_random_number' do
  #   subject(:random_game) { described_class.new }

  # end

  # Incoming Command -> Assert the direct public side effects
  # describe '#start' do
  #   context 'when user chooses the random number' do
  #     subject(:start_user_game) { described_class.new }

  # To 'Arrange' this test, each of the methods will need to be stubbed, so
  # that they do not execute. The only method that needs a return value is
  # #game_mode_selection, which creates the conditions of this test (this is
  # explained in the context line).

  # before do
  #   allow(start_user_game).to receive(:game_instructions)
  #   allow(start_user_game).to receive(:game_mode_selection).and_return(1)
  #   allow(start_user_game).to receive(:user_random)
  #   allow(start_user_game).to receive(:computer_turns)
  # end

  # To test if these methods are called, we will be using message
  # expectations.
  # https://relishapp.com/rspec/rspec-mocks/docs

  # To set a message expectation, move 'Assert' before 'Act'.

  # xit 'calls game instructions' do
  #   expect(start_user_game).to receive(:game_instructions)
  #   start_user_game.start
  # end

  # Using method expectations can be confusing. Stubbing the methods above
  # does not cause this test to pass; it only 'allows' a method to be
  # called, if it is called. To test this fact, let's allow a method that
  # is not called in #start. Uncomment the line at the bottom of this
  # paragraph, move it to the before hook, and run the tests. All of the
  # tests should continue to pass.
  # allow(start_user_game).to receive(:display_range)

  # xit 'calls user_random' do
  #   expect(start_user_game).to receive(:user_random)
  #   start_user_game.start
  # end

  # xit 'calls computer_turns' do
  #   expect(start_user_game).to receive(:computer_turns)
  #   start_user_game.start
  # end

  # Now choose one of these methods used above as a message expectation and
  # comment it out in the lib/15a_binary_game.rb file. Resave the file and
  # rerun the tests. The test of the method that you commented out should
  # fail because that method is never called.

  # Before moving on, uncomment that method in the lib/15a_binary_game.rb
  # file to have all tests passing again.
  # end

  # ASSIGNMENT #1
  # context 'when user chooses a computer-generated random number' do
  # Create a new subject to use in this context block.
  # subject(:start_random_game) { described_class.new }

  # The before hook will be similar to the above test, except the return
  # value of #game_mode_selection should be 2.
  # before do
  #   allow(start_random_game).to receive(:game_instructions)
  #   allow(start_random_game).to receive(:game_mode_selection).and_return(2)
  #   allow(start_random_game).to receive(:computer_random)
  #   allow(start_random_game).to receive(:computer_turns)
  # end

  # xit 'calls game instructions' do
  #   expect(start_random_game).to receive(:game_instructions)
  #   start_random_game.start
  # end

  # xit 'calls computer_random' do
  #   expect(start_random_game).to receive(:computer_random)
  #   start_random_game.start
  # end

  # xit 'calls computer_turns' do
  #   expect(start_random_game).to receive(:computer_turns)
  #   start_random_game.start
  # end
  #   end
  # end

  # Outgoing Command -> Expect to send
  describe '#create_binary_search' do
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

    # Below (commented out) is the previous generic 'random_number' object
    # used in TDD. Compare it to the new verifying instance_double for the
    # RandomNumber class.
    # let(:random_number) { double('random_number', value: 8) }
    # let(:computer_number) { instance_double(RandomNumber, value: 79) }
    subject(:computer_game) { described_class.new }

    context 'when user chooses a computer-generated random number' do
      before do
        computer_game.instance_variable_set(:@random_number, 79)
      end

      it 'creates a new BinarySearch' do
        expect(BinarySearch).to receive(:new).with(1, 100, 79)
        computer_game.create_binary_search
      end
    end
  end

  # ASSIGNMENT #2

  # Outgoing Command -> Expect to send
  describe '#user_random' do
    # Create a new subject to test #user_random. The subject can be created
    # outside of the context block when there is only one test condition or
    # if you are reusing the same subject for multiple context blocks.
    subject(:user_game) { described_class.new }

    context 'when user chooses the random number' do
      # Look at #user_random and determine any methods that need to be stubbed
      # and if any methods should return anything.

      it 'updates the random number' do
        user_random = 42
        allow(user_game).to receive(:random_number_input).and_return(user_random)
        allow(user_game).to receive(:player_input)
        result = user_game.user_random
        expect(result).to be(42)
      end
    end
  end

  # Outgoing Command -> Expect to send
  describe '#binary_search_guesses' do
    context 'when first guess is correct' do
      # This method uses the BinarySearch class, so let's create a double to
      # continue to test the BinaryGame class in isolation from other classes.
      let(:first_search) { instance_double(BinarySearch, guess: 50) }
      subject(:first_game) { described_class.new }

      before do
        # Unlike the #computer_random example, where RandomNumber.new returns a
        # double, this method needs the value of the instance variable
        # @binary_search to be set to the double created above.
        first_game.instance_variable_set(:@binary_search, first_search)
        allow(first_game).to receive(:display_range)
        allow(first_game).to receive(:puts)
        allow(first_game.binary_search).to receive(:game_over?).and_return(true)
        allow(first_game.binary_search).to receive(:make_guess).and_return(50)
        allow(first_game.binary_search).to receive(:make_guess).once
      end

      it 'sends make_guess once' do
        expect(first_game.binary_search).to receive(:make_guess).once
        first_game.binary_search_guesses
      end

      it 'does not send update_range' do
        expect(first_game.binary_search).not_to receive(:update_range)
        first_game.binary_search_guesses
      end
    end

    # ASSIGNMENT #3
    context 'when second guess is correct' do
      # Arrange the conditions of this test to have two guesses. Not only will
      # there be multiple return values, but there will also be another method
      # to be stubbed.
      subject(:second_game) { described_class.new }
      let(:second_search) { instance_double(BinarySearch, guess: 25) }

      before do
        second_game.instance_variable_set(:@binary_search, second_search)
        allow(second_game).to receive(:display_range)
        allow(second_game).to receive(:puts)
        allow(second_game.binary_search).to receive(:make_guess).and_return(50, 25)
        allow(second_game.binary_search).to receive(:game_over?).and_return(false, true)
        allow(second_game.binary_search).to receive(:make_guess).twice
        allow(second_game.binary_search).to receive(:update_range).once
      end

      it 'sends make_guess twice' do
        expect(second_game.binary_search).to receive(:make_guess).twice
        second_game.binary_search_guesses
      end

      it 'sends update_range once' do
        expect(second_game.binary_search).to receive(:update_range).once
        second_game.binary_search_guesses
      end
    end
  end
end

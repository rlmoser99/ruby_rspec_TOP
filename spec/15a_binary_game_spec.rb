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

# The focus of this lesson is unit testing, which is testing the behavior of
# individual methods in isolation. However, every method does not need to be
# tested, so we will look at some basic guidelines that determine whether or not
# a method needs to be tested.
# https://www.artofunittesting.com/definition-of-a-unit-test

# In general, you probably have 4 different types of methods:
# 1. Command - Performs an action and/or has a side effect.
# 2. Query - Returns a value.
# 3. Script - Only calls other methods, usually without returning anything.
# 4. Looping Script - Only call other methods, usually without returning
#    anything and stopping when certain conditions are met.

# Let's take a look at methods that should always be tested:

# 1. Public Command or Public Query Methods should always be tested, because
# they are the public interface. Command Methods should test the method's action
# or side effect. Query Methods should test the method's return value.

# 2. Command or Query Methods that are inside a public script or looping script
# method should be tested. For the games that we are making, script and looping
# script methods are just a convenient way to call the methods needed to play a
# full game. Since these methods are required to play the game, they should be
# publicly tested methods (even if you previously made them private). Pretend
# that someone will be using your class to make their own game with customized
# text. Any method that they would need in their game, should be a publicly
# tested method.

# 3. Any Method that sends a command message to another class should always test
# that those messages were sent.

# 4. A Looping Script Method should test the behavior of the method. For
# example, that it stops when certain conditions are met.

# Here is a summary of what should be tested
# 1. Command Method -> Test the action/side effect
# 2. Query Method -> Test the return value
# 3. Method with Outgoing Command -> Test that a message is sent
# 4. Looping Script Method -> Test the behavior of the method

# There are a handful of methods that you do not need to test:

# 1. You do not have to test #initialize if it is only creating instance
# variables. However, if you call methods inside the initialize method, you
# might need to test #initialize and/or the inside methods. In addition, you
# will need to stub any inside methods because they will be called when you
# create an instance of the class.

# 2. Methods that only contain 'puts' or 'gets' because they are well-tested
# in the standard ruby library.

# 3. Private methods do not need to be tested because they should have test
# coverage in public methods. However, as previously discussed, you may have
# some private methods that are called inside a script or looping script method,
# that should be publicly tested methods.

describe BinaryGame do
  describe '#initialize' do
    # Initialize -> No test neccessary, when only creating instance variables.
  end

  describe '#play_game' do
    # Public Script Method -> No test neccessary, but all methods inside should
    # be tested.
  end

  describe '#player_input' do
    # Located inside #play_game (Public Script Method)
    # Command Method -> Test the action/side effect

    subject(:player_game) { described_class.new(1, 10) }

    context 'when user input is between parameters' do
      it 'returns user input' do
        user_input = '4'
        allow(player_game).to receive(:gets).and_return(user_input)
        min = 1
        max = 10
        result = player_game.player_input(min, max)
        # This method gets a string ('4') and turns into an integer (4).
        user_number = 4
        expect(result).to eq(user_number)
      end
    end

    # Remember a method stub can be called multiple times and return different values.
    # https://relishapp.com/rspec/rspec-mocks/docs/configuring-responses/returning-a-value
    context 'when first user input is not between parameters' do
      it 'returns second user input' do
        letter = 'r'
        user_input = '9'
        user_number = 9
        allow(player_game).to receive(:gets).and_return(letter, user_input)
        allow(player_game).to receive(:puts).once
        min = 1
        max = 10
        result = player_game.player_input(min, max)
        expect(result).to eq(user_number)
      end
    end

    context 'when first and second user input is not between parameters' do
      xit 'returns third user input' do
      end
    end
  end

  describe '#update_random_number' do
    # Located inside #play_game (Public Script Method)
    # Method with Outgoing Command -> Test that a message is sent

    # Look at the #update_random_number in the BinaryGame class. This method
    # gets the user's input & wants to update the value of the @random_number.
    # If the RandomNumber class had a public setter method (like attr_accessor)
    # for @value, we could update @random_number's value inside the BinaryGame
    # class. For example: @random_nmber.value = number_input

    # However, this breaks the encapsulation of the RandomNumber class. As a
    # general rule, you want to minimize what classes know about other classes.
    # You should not let BinaryGame update the value of a RandomNumber. Instead,
    # you want BinaryGame to just send a message to RandomNumber telling it to
    # update the value. For example: @random_number.update_value(number_input)

    context 'when updating value of random number' do
      # Instead of using a normal double, we are going to use an instance_double. An instance_double is a verifying double that will produce an error if it is used in a way that does not exist in the actual class.

      # HELP!!!
      # will produce an error if a method is called that does not exist in the actual class.
      # verifies that any methods being stubbed would be present on an instance of that class.

      # Therefore using a 'verifying double' makes a test more stable.
      # https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/verifying-doubles

      # Unit testing relies on using doubles to test the object in isolation
      # (i.e., not dependent on any other object). One important concept to
      # understand is that the BinaryGame or FindNumber class doesn't care if it
      # is given an actual random_number class object. It only cares that it is
      # given an object that can respond to certain methods. This concept is
      # called polymorphism.
      # https://www.geeksforgeeks.org/polymorphism-in-ruby/

      # Below (commented out) is the previous generic 'random_number' object
      # used in TDD. Compare it to the new verifying instance_double for the
      # RandomNumber class.
      # let(:random_number) { double('random_number', value: 8) }

      subject(:game_update) { described_class.new(1, 100, random_update) }
      let(:random_update) { instance_double(RandomNumber, value: 3) }

      # To 'Arrange' this test, two methods will need to be stubbed, so that they do not execute. #player_input will have two parameters and will need to return the new_number.

      # We need to specify the arguments using matching arguments:
      # https://relishapp.com/rspec/rspec-mocks/docs/setting-constraints/matching-arguments

      before do
        allow(game_update).to receive(:puts)
        new_number = 76
        allow(game_update).to receive(:player_input).with(1, 100).and_return(new_number)
      end

      # To test if #update_value is sent to the RandomNumber instance (random_update) with the correct value (76), we will be using message expectations.
      # https://relishapp.com/rspec/rspec-mocks/docs

      # To set a message expectation, move 'Assert' before 'Act'.

      it 'sends update_value to random_number' do
        expect(random_update).to receive(:update_value).with(76)
        game_update.update_random_number
      end
    end

    # You'll get a chance to use message expectations for #display_binary_search
  end

  describe '#maximum_guesses' do
    # Located inside #play_game (Public Script Method)
    # Query Method -> Test the return value

    context 'when game minimum and maximum is 1 and 10' do
      subject(:game_ten) { described_class.new(1, 10) }

      it 'returns 4' do
        max = game_ten.maximum_guesses
        expect(max).to eq(4)
      end
    end

    context 'when game minimum and maximum is 1 and 100' do
      subject(:game_hundred) { described_class.new(1, 100) }

      it 'returns 7' do
        max = game_hundred.maximum_guesses
        expect(max).to eq(7)
      end
    end

    # ASSIGNMENT

    context 'when game minimum and maximum is 100 and 600' do
      xit 'returns 9' do
      end
    end
  end

  describe '#display_binary_search' do
    # Located inside #play_game (Public Script Method)

    # Method with Outgoing Command -> Test that a message is sent

    # Looping Script -> Test the behavior of the method (for example, it
    # stopping when certain conditions are met).

    # DOES THIS NEED TO BE TWO SEPARATE CONTEXTS - CAN THEY SHARE SET-UP?

    context 'when first guess is correct' do
      subject(:first_game) { described_class.new(1, 10, first_number) }
      let(:first_number) { instance_double(RandomNumber) }
      let(:first_search) { instance_double(BinarySearch, min: 1, max: 10) }

      before do
        allow(BinarySearch).to receive(:new).and_return(first_search)
        allow(first_game).to receive(:display_range)
        allow(first_search).to receive(:make_guess).and_return(5)
        allow(first_game).to receive(:puts)
        allow(first_search).to receive(:guess).and_return(5)
        allow(first_search).to receive(:game_over?).and_return(true)
      end

      # We will be using message expectations again.

      it 'creates a new binary search' do
        expect(BinarySearch).to receive(:new).with(1, 10, first_number)
        first_game.display_binary_search
      end

      it 'sends make_guess once' do
        expect(first_search).to receive(:make_guess).once
        first_game.display_binary_search
      end

      it 'stops loop and does not send update_range' do
        expect(first_search).not_to receive(:update_range)
        first_game.display_binary_search
      end
    end

    # ASSIGNMENT

    context 'when second guess is correct' do
      xit 'creates a new binary search' do
      end

      xit 'sends make_guess twice' do
      end

      xit 'stops loop and only sends update_range once' do
      end
    end
  end

  describe '#introduction' do
    # Located inside #play_game (Public Script Method)
    # Only contains puts statements -> No test neccessary & can be private.
  end

  describe '#display_range' do
    # Located inside #display_binary_search (Looping Script Method)
    # Only contains puts statements -> No test neccessary & can be private.
  end

  describe '#print_number' do
    # Only contains puts statements -> No test neccessary & can be private.
  end
end

# Using method expectations can be confusing. Stubbing the methods above
# does not cause this test to pass; it only 'allows' a method to be
# called, if it is called. To test this fact, let's allow a method that
# is not called in #start. Uncomment the line at the bottom of this
# paragraph, move it to the before hook, and run the tests. All of the
# tests should continue to pass.
# allow(game).to receive(:display_range)

# Now choose one of these methods used above as a message expectation and
# comment it out in the lib/15a_binary_game.rb file. Resave the file and
# rerun the tests. The test of the method that you commented out should
# fail because that method is never called.

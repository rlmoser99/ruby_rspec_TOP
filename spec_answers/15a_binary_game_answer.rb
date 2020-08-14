# frozen_string_literal: true

require_relative '../lib/15a_binary_game'
require_relative '../lib/15b_binary_search'
require_relative '../lib/15c_random_number'

# The file order to complete this lesson:

# 1. Familarize yourself with the three lib/15 files.
#    - lib/15_binary_main
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

# INSERT -> SCRIPT EXPLANATION

# Timato:
# The API of game would be the methods create_players, play_turns and game_over_message. Those should be tested. start_game is basically a script to automate those. That script could be standalone in another file.
# In the normal course of testing you'd write an integration test to check all the parts worked together as expected.
# That's the way I concluded it should work because otherwise testing is a nightmare. To have such a narrow entry point to the class that did everything is a huge pain. I've seen some of the solutions that throw the game loop script in another file to allow someone to start a game quickly
# If you do want to keep it in Game that is fine btw, don't feel you have to move it, but have the other methods still part of your public API and test them
# It's not the worst idea to have it inside a class somewhere though because then it's easier to call again if you want to start a new game for example. I've swayed between a separate class handling the DSL side of things like getting player names etc and then running the game or making it a class method in game and then creating a new game and doing the setup which would be easy to call again in that class method. Depends how you are setting up the game.
# The way I like to think of it though is that you are exposing an API that could be used by others to build their own games. So in tictactoe you can provide the methods for a standard game but someone else could use them to build out their own game loop and do something a bit different. Maybe add in their own custom text etc. The script to run a game is just a convenience to allow someone to run a standard game without the hassle of having to set it up.
# I could be wrong but I also had to wonder how I was going to write a test for one public method that called 3 - 5 other methods including one that was a loop when I wrote tictactoe and I just can't see how you'd do that easily without a horrible test file which was impossible to read. Usually a sign of a missing extraction

# The majority of BinaryGame methods are 'sent to self', therefore we can ignore
# them for unit testing.

# In addition, you do not need to test #initialize if it is only creating
# instance variables. This can cause the test to be fragile, breaking anytime
# an instance variable name is changed. If you choose to call methods inside the
# initialize method, you will need to stub each method for every instance in the
# tests.

# That leaves 5 methods to test - #mode_selection, #user_random, #find_random_number,
# #create_binary_search, and #binary_search_guesses

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

# describe BinaryGame do
#   # Incoming Command -> Assert the direct public side effects
#   describe '#mode_selection' do
#     subject(:game_mode) { described_class.new }

#     # To 'Arrange' this test, each of the methods will need to be stubbed, so
#     # that they do not execute. The only method that needs a return value is
#     # #mode_input, which is also the return value of this method.

#     before do
#       user_input = 1
#       allow(game_mode).to receive(:introduction)
#       allow(game_mode).to receive(:mode_choices)
#       allow(game_mode).to receive(:mode_input).and_return(user_input)
#     end

#     it 'returns user input' do
#       result = game_mode.mode_selection
#       expect(result).to eq(1)
#     end
#   end

#   describe '#find_random_number' do
#     subject(:game_find) { described_class.new }

#     before do
#       allow(game_find).to receive(:create_binary_search)
#       allow(game_find).to receive(:binary_search_guesses).and_return(55)
#     end

#     it 'returns random number' do
#       result = game_find.find_random_number
#       expect(result).to eq(55)
#     end
#   end

#   describe '#find_random_number' do
#     subject(:number_game) { described_class.new }
#     let(:number_search) { instance_double(BinarySearch, guess: 50, answer: 50, min: 1, max: 100, make_guess: 50, game_over?: true) }

#     before do
#       number_game.instance_variable_set(:@binary_search, number_search)
#       allow(number_game).to receive(:create_binary_search)
#       allow(number_game).to receive(:puts)
#       allow(number_game).to receive(:display_range)
#     end

#     it 'returns random number' do
#       result = number_game.find_random_number
#       expect(result).to eq(50)
#     end
#   end

#   # Outgoing Command -> Expect to send
#   describe '#create_binary_search' do
#     subject(:computer_game) { described_class.new }

#     context 'when user chooses a computer-generated random number' do
#       before do
#         computer_game.instance_variable_set(:@random_number, 79)
#       end

#       it 'creates a new BinarySearch' do
#         expect(BinarySearch).to receive(:new).with(1, 100, 79)
#         computer_game.create_binary_search
#       end
#     end
#   end

#   # Outgoing Command -> Expect to send
#   describe '#user_random' do
#     # INSERT -> CLASS ENCAPSULATION EXPLANATION
#     subject(:user_game) { described_class.new }

#     context 'when user chooses the random number' do
#       it 'updates the random number' do
#         user_random = 42
#         allow(user_game).to receive(:random_number_input).and_return(user_random)
#         allow(user_game).to receive(:player_input)
#         result = user_game.user_random
#         expect(result).to be(42)
#       end
#     end
#   end

#   # Outgoing Command -> Expect to send
#   describe '#binary_search_guesses' do
#     context 'when first guess is correct' do
#       let(:first_search) { instance_double(BinarySearch, guess: 50) }
#       subject(:first_game) { described_class.new }

#       before do
#         first_game.instance_variable_set(:@binary_search, first_search)
#         allow(first_game).to receive(:display_range)
#         allow(first_game).to receive(:puts)
#         allow(first_game.binary_search).to receive(:game_over?).and_return(true)
#         allow(first_game.binary_search).to receive(:make_guess).and_return(50)
#         allow(first_game.binary_search).to receive(:make_guess).once
#       end

#       it 'sends make_guess once' do
#         expect(first_game.binary_search).to receive(:make_guess).once
#         first_game.binary_search_guesses
#       end

#       it 'does not send update_range' do
#         expect(first_game.binary_search).not_to receive(:update_range)
#         first_game.binary_search_guesses
#       end
#     end

#     context 'when second guess is correct' do
#       subject(:game) { described_class.new }
#       let(:second_search) { instance_double(BinarySearch, guess: 25) }

#       before do
#         game.instance_variable_set(:@binary_search, second_search)
#         allow(game).to receive(:display_range)
#         allow(game).to receive(:puts)
#         allow(game.binary_search).to receive(:make_guess).and_return(50, 25)
#         allow(game.binary_search).to receive(:game_over?).and_return(false, true)
#         allow(game.binary_search).to receive(:make_guess).twice
#         allow(game.binary_search).to receive(:update_range).once
#       end

#       it 'sends make_guess twice' do
#         expect(game.binary_search).to receive(:make_guess).twice
#         game.binary_search_guesses
#       end

#       it 'sends update_range once' do
#         expect(game.binary_search).to receive(:update_range).once
#         game.binary_search_guesses
#       end
#     end
#   end
# end

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

# Create a new subject to test #user_random. The subject can be created
# outside of the context block when there is only one test condition or
# if you are reusing the same subject for multiple context blocks.
# Look at #user_random and determine any methods that need to be stubbed
# and if any methods should return anything.

# This method uses the BinarySearch class, so let's create a double to
# continue to test the BinaryGame class in isolation from other classes.
# Unlike the #computer_random example, where RandomNumber.new returns a
# double, this method needs the value of the instance variable
# @binary_search to be set to the double created above.

# Arrange the conditions of this test to have two guesses. Not only will
# there be multiple return values, but there will also be another method
# to be stubbed.

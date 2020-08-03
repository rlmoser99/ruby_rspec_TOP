# frozen_string_literal: true

require_relative '../lib/13_input_output'

# Ruby code that was written before you learned how to use RSpec may be nearly
# impossible to test. For example, in the 13_input_output file, there are two
# identical games: ImpossibleToTestGame and NumberGame. Take a look at each
# game and look for differences that may make one easier or harder to test
# than the other.

# One key difference is that NumberGame has smaller, isolated methods.

# Small and isolated methods that only do one thing are easier to test.
# Long methods are like a run-on sentence that should have been divided into 2 or 3 different sentences so that everything could be clearly understood and in this case if a method does many different things it can be difficult to test.

# So if you are new to testing, be open to refactoring your previous
# code, to make writing tests easier. As you learn testing, you will also
# learn how to write better testable methods.

# The tests in this file are longer than the previous examples so far.
# To get your bearings, remember to reference the following lines:
# describe -> Name of the method that is being tested.
# context ->  Explains the conditions of the test.
# it ->       Explains the results of the test.

describe NumberGame do
  subject(:game) { described_class.new }

  describe '#initialize' do
    it 'is a number between 0 and 9' do
      solution = game.solution
      expect(solution).to be >= 0
      expect(solution).to be < 10
    end

    # ASSIGNMENT
    # Write a similar test to the one above, that uses a custom matcher
    # instead of <, >, =.
    matcher :be_between_zero_and_nine do
      match { |number| number.between?(0, 9) }
    end

    # remove the 'x' before running this test
    it 'is a number between 0 and 9' do
      solution = game.solution
      expect(solution).to be_between_zero_and_nine
    end
  end

  describe '#game_over?' do
    context 'when user guess is correct' do
      it 'is game over' do
        game.instance_variable_set(:@solution, 5)
        game.instance_variable_set(:@guess, '5')
        expect(game).to be_game_over
      end
    end

    # ASSIGNMENT
    # Write one test for when game.solution does not equal correct_guess?
    context 'when user guess is not correct' do
      # remove the 'x' before running this test
      it 'is not game over' do
        game.instance_variable_set(:@solution, 5)
        game.instance_variable_set(:@guess, '2')
        expect(game).to_not be_game_over
      end
    end
  end

  # The #player_input method is used in the game as an argument passed into the
  # verify_input method. The #player_input method is not tested because it is a
  # protected method. In addition, it is unneccessary to test methods that only
  # contain puts and/or gets. However, at the bottom of the answer file is an
  # example of how you would test the #player_input method if it were not
  # protected.

  # Since we do not have to test #player_input, let's test #verify_input.

  describe '#verify_input' do
    # Note: #verify_input is a recursive method that will repeat until
    # #valid_input? is true.

    context 'when given a valid input as argument' do
      it 'returns valid input' do
        user_input = '3'
        verified_input = game.verify_input(user_input)
        expect(verified_input).to eq('3')
      end
    end

    # In order to test #verify_input receiving an invalid input, we need to use
    # a method stub. In this example, the method stub will return the valid
    # input, 'number_input', which will be the final result of this test.
    # To stub this method, you 'allow' the test subject (game) to receive the
    # :method_name and to return a specific value.
    # https://relishapp.com/rspec/rspec-mocks/v/2-14/docs/method-stubs/allow-with-a-simple-return-value
    # http://testing-for-beginners.rubymonstas.org/test_doubles.html

    context 'when given invalid input once before valid input' do
      letter_input = 'g'
      number_input = '5'

      # When using the same 'Arrange' part of a test, you can utilize before
      # hooks to set up the test conditions.
      # https://relishapp.com/rspec/rspec-core/v/2-0/docs/hooks/before-and-after-hooks\

      before do
        # The stub below will return the number_input when called.
        allow(game).to receive(:player_input).and_return(number_input)
      end

      it 'loops once until it receives valid input' do
        # The stub below will remove the 'Input error!' from appearing in the
        # test output.
        allow(game).to receive(:puts)

        # This method starts with the invalid parameter (letter_input = 'g')
        verified_input = game.verify_input(letter_input)

        # However, the result of 'verified_input' is the valid parameter.
        # (number_input = '5')
        expect(verified_input).to eq('5')
      end

      it 'displays error message once' do
        # Due to the loop, we can test that the game received :puts with the
        # error message one time. In order to test if this method is called,
        # we will be using a message expectation.
        # https://relishapp.com/rspec/rspec-mocks/docs

        # To set a message expectation, move 'Assert' before 'Act'.
        expect(game).to receive(:puts).once.with('Input error!')
        game.verify_input(letter_input)
      end
    end

    # ASSIGNMENT
    context 'when given invalid input twice before valid input' do
      letter_input = 'h'
      number_input = '3'
      # Create another invalid input (anything except a digit between 0 and 9).
      symbol_input = '@'

      before do
        # A method stub can be called multiple times and return different values.
        # https://relishapp.com/rspec/rspec-mocks/docs/configuring-responses/returning-a-value
        # Create a stub method to receive :player_input and return your invalid
        # input and the number_input.
        allow(game).to receive(:player_input).and_return(symbol_input, number_input)
      end

      it 'loops twice until it receives valid input' do
        allow(game).to receive(:puts).twice
        verified_input = game.verify_input(letter_input)
        expect(verified_input).to eq('3')
      end

      it 'displays error message twice' do
        expect(game).to receive(:puts).twice.with('Input error!')
        game.verify_input(letter_input)
      end
    end
  end

  # It is unneccessary to write tests for methods that only contain puts
  # statements, like #final_message. Puts is a basic part of the standard
  # ruby library & is already well tested. Plus, most 'real world
  # applications' don't even output like this except to loggers.

  # However, here is an example of how to test 'puts' using the output matcher.
  # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/output-matcher

  describe '#final_message' do
    context 'when count is 1' do
      it 'outputs correct phrase' do
        game.instance_variable_set(:@count, 1)
        lucky_phrase = "LUCKY GUESS!\n"
        # The output matcher needs a block of code to assert.
        expect { game.final_message }.to output(lucky_phrase).to_stdout
      end
    end

    # ASSIGNMENT
    context 'when count is 2-3' do
      # remove the 'x' before running this test
      it 'outputs correct phrase' do
        # Set the instance variable of count
        game.instance_variable_set(:@count, 3)
        congrats_phrase = "Congratulations! You picked the random number in 3 guesses!\n"
        expect { game.final_message }.to output(congrats_phrase).to_stdout
      end
    end

    # ASSIGNMENT
    context 'when count is 4 and over' do
      # remove the 'x' before running this test
      it 'outputs correct phrase' do
        # Write the entire test for the conditions in the context.
        game.instance_variable_set(:@count, 7)
        hard_phrase = "That was hard. It took you 7 guesses!\n"
        expect { game.final_message }.to output(hard_phrase).to_stdout
      end
    end
  end

  # This method is a PROTECTED method and it does NOT need to be tested.
  # This method is only used as parameter for the #verify_input method.
  # It is unneccessary to test methods that only contain puts and/or gets
  # because they are well-tested in the standard ruby library. However, if this
  # test was public (instead of protected) and you had to test it, you'll need
  # to create a stub for the puts & gets method.
  # https://relishapp.com/rspec/rspec-mocks/v/2-14/docs/method-stubs/stub-with-substitute-implementation

  # describe '#player_input' do
  #   it 'returns player input' do
  #     prompt = 'Choose a digit between 0 and 9'
  #     user_input = '3'
  #     allow(game).to receive(:puts).once.with(prompt)
  #     allow(game).to receive(:gets).and_return(user_input)
  #     result = game.player_input
  #     expect(result).to eq('3')
  #   end
  # end
end

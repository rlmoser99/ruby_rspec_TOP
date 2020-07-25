# frozen_string_literal: true

require_relative '../lib/13_input_output'

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# Ruby code that was written before you learned how to use rpsec, may be nearly
# impossible to test. For example, in the 13_input_output file, there are two
# identical games - ImpossibleToTestGame and NumberGame. Take a look at both
# game and look for the differences that may make it easier or harder to test.

# One key difference is that NumberGame has smaller, isolated methods.

# Small and isolated methods that only do one thing are easier to test.
# Long methods are like a run-on sentence that should have been divided into 2 or 3 different sentences so that everything could be clearly understood and in this case if a method does many different things it can be difficult to test.

# Therefore, if you are new to testing, be open to refactoring your previous
# code to make writing testing easier. As you learn testing, you are also
# learning how to write better testable methods.

describe NumberGame do
  subject(:game) { described_class.new }

  describe '#initialize' do
    it 'is a number 0 - 9' do
      solution = game.solution
      expect(solution).to be >= 0
      expect(solution).to be < 10
    end

    # ASSIGNMENT
    # Write a similar test as the one above, that uses a custom matcher,
    # instead of <, >, =.

    # remove the 'x' before running this test
    xit 'is a number between 0 and 9' do
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
      xit 'is not game over' do
      end
    end
  end

  # The #player_input method is used in the game as an argument passed into the
  # verify_input method. The #player_input method is not tested because it is a
  # protected method. In addition, it is unneccessary to test methods that only
  # contain puts and/or gets. However, at the bottom of the answer file is an
  # example of how to test the #player_input method if it were not protected.

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
      # hooks to set-up the test conditions.
      # https://relishapp.com/rspec/rspec-core/v/2-0/docs/hooks/before-and-after-hooks\

      before do
        # The stub below will return the number_input when called.
        allow(game).to receive(:player_input).and_return(number_input)
      end

      it 'loops once until it receives valid input' do
        # The stub below will remove the 'Input error!' from appearing in the
        # test output.
        allow(game).to receive(:puts)

        # This test starts with the invalid parameter (letter_input = 'g').
        verified_input = game.verify_input(letter_input)

        # The result of 'verified_input' is the valid parameter, because
        # of the player_input stub in the before hook (number_input = '5').
        expect(verified_input).to eq('5')
      end

      it 'displays error message once' do
        # Due to the loop, we can test that the game received :puts with the
        # error message one time. In order to do this, we will need to move
        # 'Assert' before 'Act', which is an example of mocking.
        # http://testing-for-beginners.rubymonstas.org/test_doubles.html
        expect(game).to receive(:puts).once.with('Input error!')
        game.verify_input(letter_input)
      end
    end

    # ASSIGNMENT
    context 'when given invalid input twice before valid input' do
      letter_input = 'h'
      number_input = '3'
      # Create another invalid input (anything except a digit between 0-9).

      before do
        # A method stub can be called multiple times and return different values.
        # https://relishapp.com/rspec/rspec-mocks/docs/configuring-responses/returning-a-value
        # Create a stub method to receive :player_input and return your invalid
        # input and the number_input.
      end

      # remove the 'x' before running this test
      xit 'loops twice until it receives valid input' do
        # Creating a stub method for :puts is optional

        verified_input = game.verify_input(letter_input)
        expect(verified_input).to eq(number_input)
      end

      # remove the 'x' before running this test
      xit 'displays error message twice' do
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
      xit 'outputs correct phrase' do
        # Set the instance variable of count

        congrats_phrase = "Congratulations! You picked the random number in 3 guesses!\n"
        expect { game.final_message }.to output(congrats_phrase).to_stdout
      end
    end

    # ASSIGNMENT
    context 'when count is 4 and over' do
      # remove the 'x' before running this test
      xit 'outputs correct phrase' do
        # Write the entire test for the conditions in the context.
      end
    end
  end
end
# rubocop:enable Layout/LineLength, Metrics/BlockLength

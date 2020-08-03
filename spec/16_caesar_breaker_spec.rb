# frozen_string_literal: true

require_relative '../lib/16_caesar_breaker'
require_relative '../lib/16_caesar_translator'

# The CaesarBreaker class creates a yaml file with the 25 possible translations,
# using a CaesarTranslator class and a Database module. The tests for the
# CaesarTranslator are in 16_caesar_translator_spec.

# Let's write tests for the CaesarBreaker class & the included Database module.

# Here are the three kinds of methods that need to be tested in unit testing:
# Incoming Query ->     Assert the result
# Incoming Command ->   Assert the direct public side effects
# Outgoing Command ->   Expect to send

# In this example, you will be writing tests for 3 methods - #decrypt,
# #create_decrypted_messages, and #save_to_yaml. In addition, you will learn
# about testing module methods and how to handle testing methods that can raise
# errors.

describe CaesarBreaker do
  # The tests for CaesarBreaker do not depend on creating different scenarios.
  # Therefore we can use the same subject instance for all of these tests.
  subject(:phrase) { described_class.new('Ebiil, Tloia!') }

  # ASSIGNMENT #1
  # Write the following two tests for #decrypt

  # Incoming Command -> Assert the direct public side effects
  describe '#decrypt' do
    xit 'calls create_decrypted_messages' do
    end

    xit 'calls save_decrypted_messages' do
    end
  end

  # ASSIGNMENT #2
  # Write the following test for #create_decrypted_messages

  # Outgoing Command -> Expect to send
  describe '#create_decrypted_messages' do
    xit 'sends translate 25 times' do
    end
  end

  # MODULE TESTING: There are several ways to test methods inside a module.

  # Some prefer explicitly including it in the configuration option.
  # https://relishapp.com/rspec/rspec-core/docs/helper-methods/define-helper-methods-in-a-module

  # Some prefer testing modules using a dummy class.
  # https://mixandgo.com/learn/how-to-test-ruby-modules-with-rspec

  # Modules can also be tested in a class that includes it, which is how the
  # following tests work.

  # Incoming Command -> Assert the direct public side effects
  # You'll find the below method in 16_database.rb
  describe '#save_decrypted_messages' do
    # This method has a rescue block in case an error occurs.
    # Let's test that this method can run without raising an error.
    # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/raise-error-matcher

    context 'when it saves a file' do
      it 'does not raise an error' do
        expect { phrase.save_decrypted_messages }.not_to raise_error
      end

      # The test above will pass when you run it, but it will also output
      # two lines from #display_file_location.
      # So let's stub out that method to clean up the test output.
      it 'does not raise an error' do
        allow(phrase).to receive(:display_file_location)
        expect { phrase.save_decrypted_messages }.not_to raise_error
      end
    end

    # When a method rescues an error, the method will still not raise an error.
    # Therefore you test the conditions that happens if an error was rescued.
    context 'when rescuing an error' do
      before do
        allow(File).to receive(:open).and_raise(Errno::ENOENT)
        allow(phrase).to receive(:puts).twice
      end

      it 'does not raise an error' do
        expect { phrase.save_decrypted_messages }.not_to raise_error
      end

      it 'does not display file location' do
        expect(phrase).not_to receive(:display_file_location)
        phrase.save_decrypted_messages
      end

      it 'displays error rescue message' do
        expect(phrase).to receive(:puts).twice
        phrase.save_decrypted_messages
      end
    end
  end

  # ASSIGNMENT #3
  # Write the following test for #save_to_yaml
  # This method is found in 16_database.rb

  # Outgoing Command -> Expect to send
  describe '#save_to_yaml' do
    xit 'dumps to yaml' do
    end
  end
end

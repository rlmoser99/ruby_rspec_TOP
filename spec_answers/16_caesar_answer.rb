# frozen_string_literal: true

require_relative '../lib/16_caesar_breaker'

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# Let's write tests for an entire class & the included module.
# Several of these methods could be private methods for this class, which would not need to be tested.
# However, testing every method offers good practice and introduces a few new concepts.

describe CaesarBreaker do
  subject(:phrase) { described_class.new('Ebiil, Tloia!') }

  # You do not need to test #initialize if it is only creating instance variables.
  # This can cause the test to be fragile, breaking anytime an instance variable name is changed.

  # To test #decrypt, we will need to move 'Assert' before 'Act', which is an example of mocking.
  # http://testing-for-beginners.rubymonstas.org/test_doubles.html
  describe '#decrypt' do
    it 'calls create_decrypted_messages and save_decrypted_messages' do
      expect(phrase).to receive(:create_decrypted_messages)
      expect(phrase).to receive(:save_decrypted_messages)
      phrase.decrypt
    end
  end

  # ASSIGNMENT

  # Write at least one test for each of the following methods:
  describe '#create_decrypted_messages' do
    it 'creates 25 decrypted messages' do
      phrase.create_decrypted_messages
      number_of_messages = phrase.decrypted_messages.length
      expect(number_of_messages).to eq(25)
    end
  end

  describe '#translate' do
    it 'shifts entire phrase' do
      shift = 1
      result = phrase.translate(shift)
      expect(result).to eq('Fcjjm, Umpjb!')
    end
  end

  describe '#character_shift' do
    it 'shifts one letter' do
      character = 'A'
      base = 65
      shift = 1
      result = phrase.character_shift(character, base, shift)
      expect(result).to eq('B')
    end

    # ASSIGNMENT

    # Write the following test using a special character
    it 'does not shift non-letters' do
      character = '?'
      base = 65
      shift = 1
      result = phrase.character_shift(character, base, shift)
      expect(result).to eq('?')
    end
  end

  # MODULE TESTING: Some prefer testing modules using a dummy class.
  # https://mixandgo.com/learn/how-to-test-ruby-modules-with-rspec
  # Modules can also be tested in a class that includes it.

  describe '#save_decrypted_messages' do
    # This method has a rescue block in case an error occurs.
    # Let's test that this method can run without raising an error
    # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/raise-error-matcher

    it 'saves a file without raising an error' do
      expect { phrase.save_decrypted_messages }.not_to raise_error
    end

    # The test above outputs two lines from #display_file_location.
    # So, let stub out that method to clean up the test output.
    it 'saves a file without raising an error' do
      expect(phrase).to receive(:display_file_location)
      expect { phrase.save_decrypted_messages }.not_to raise_error
    end

    # When a method rescues an error, the method will still not raise an error.
    # Therefore, you test the conditions that would happen if an error was rescued.
    it 'rescues an error' do
      allow(File).to receive(:open).and_raise(Errno::ENOENT)
      expect(phrase).not_to receive(:display_file_location)
      expect(phrase).to receive(:puts).twice
      expect { phrase.save_decrypted_messages }.not_to raise_error
    end
  end

  # ASSIGNMENT

  # Write at least one test for each of the following methods:
  describe '#save_to_yaml' do
    it 'dumps to yaml' do
      expect(YAML).to receive(:dump)
      phrase.save_to_yaml
    end
  end

  describe '#create_filename' do
    it 'creates filename using letter characters only' do
      filename = phrase.create_filename
      expect(filename).to eq('EbiilTloia')
    end
  end

  describe '#display_file_location' do
    it 'displays the file location' do
      message = phrase.message
      expect(phrase).to receive(:puts).once.with("'#{message}' has been decoded.")
      expect(phrase).to receive(:puts).once.with('The 25 possibilities are saved in a file in 16_cipher/')
      phrase.display_file_location
    end
  end
end
# rubocop:enable Layout/LineLength, Metrics/BlockLength

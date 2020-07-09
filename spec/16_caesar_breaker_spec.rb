# frozen_string_literal: true

require_relative '../lib/16_caesar_breaker'
# require_relative '../lib/16_database'

describe CaesarBreaker do
  subject(:phrase) { described_class.new('Ebiil, Tloia!') }

  describe '#initialize' do
    it 'has a message to decrypt' do
      expect(phrase.message).to eq('Ebiil, Tloia!')
    end

    it 'has no decrypted_messages result' do
      expect(phrase.decrypted_messages).to be_empty
    end
  end

  describe '#decrypt' do
    it 'calls create_decrypted_messages and save_decrypted_messages' do
      expect(phrase).to receive(:create_decrypted_messages)
      expect(phrase).to receive(:save_decrypted_messages)
      phrase.decrypt
    end
  end

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

    it 'does not shift non-letters' do
      character = '?'
      base = 65
      shift = 1
      result = phrase.character_shift(character, base, shift)
      expect(result).to eq('?')
    end
  end

  describe '#save_decrypted_messages' do
    it 'saves a file without raising an error' do
      expect(phrase).to receive(:create_filename)
      expect(phrase).to receive(:display_file_location)
      expect { phrase.save_decrypted_messages }.not_to raise_error
    end

    it 'rescues an error' do
      expect(phrase).to receive(:create_filename)
      allow(File).to receive(:open).and_raise(Errno::ENOENT)
      expect(phrase).to receive(:puts).twice
      phrase.save_decrypted_messages
    end

    it 'rescues an error' do
      expect(phrase).to receive(:create_filename)
      allow(File).to receive(:open).and_raise(Errno::ENOENT)
      expect(phrase).to receive(:puts).twice
      # expect(phrase).to receive(:puts).once.with('Error while writing to file .yaml.')
      expect { phrase.save_decrypted_messages }.not_to raise_error
    end

    # it 'rescues an error' do
    #   expect_any_instance_of(CaesarBreaker).to receive(:create_decode_messages)
    #   expect(phrase).to receive(:create_filename)
    #   allow(File).to receive(:open).and_raise(Errno::ENOENT)
    #   expect(phrase).to receive(:puts).once.with('Error while writing to file .yaml.')
    #   # error_message = '#<Errno::ENOENT: No such file or directory>'
    #   phrase.save_message
    # end
  end

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

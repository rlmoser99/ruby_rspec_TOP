# frozen_string_literal: false

# # https://relishapp.com/rspec/rspec-core/docs/helper-methods/define-helper-methods-in-a-module

RSpec.configure do |c|
  c.include Database
end

describe CaesarBreaker do
  subject(:phrase) { described_class.new('Ebiil, Tloia!') }

  describe '#initialize' do
    it 'is a CaesarBreaker' do
      expect_any_instance_of(CaesarBreaker).to receive(:create_decode_messages)
      expect(phrase).to be_a(CaesarBreaker)
    end
  end

  describe '#save_message' do
    it 'saves a file without raising an error' do
      expect_any_instance_of(CaesarBreaker).to receive(:create_decode_messages)
      expect(phrase).to receive(:create_filename)
      # expect(File).to exist('/Users/rmoser/projects/odin_on_rails/ruby_rspec_TOP/spec/cipher/EbiilTloia.yaml')
      expect(phrase).to receive(:display_file_location)
      expect { phrase.save_message }.not_to raise_error
    end

    it 'rescues an error' do
      expect_any_instance_of(CaesarBreaker).to receive(:create_decode_messages)
      expect(phrase).to receive(:create_filename)
      allow(File).to receive(:open).and_raise(Errno::ENOENT)
      expect(phrase).to receive(:puts).twice
      phrase.save_message
    end

    it 'rescues an error' do
      expect_any_instance_of(CaesarBreaker).to receive(:create_decode_messages)
      expect(phrase).to receive(:create_filename)
      allow(File).to receive(:open).and_raise(Errno::ENOENT)
      expect(phrase).to receive(:puts).twice
      expect { phrase.save_message }.not_to raise_error
    end

    it 'rescues an error' do
      expect_any_instance_of(CaesarBreaker).to receive(:create_decode_messages)
      expect(phrase).to receive(:create_filename)
      allow(File).to receive(:open).and_raise(Errno::ENOENT)
      expect(phrase).to receive(:puts).once.with('Error while writing to file .yaml.')
      # error_message = '#<Errno::ENOENT: No such file or directory>'
      phrase.save_message
    end
  end
end

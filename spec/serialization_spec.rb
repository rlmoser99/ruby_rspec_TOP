# frozen_string_literal: false

require 'yaml'

# Contains methods to save or load a game
module Database
  def save_message
    Dir.mkdir 'cipher' unless Dir.exist? 'cipher'
    @filename = "#{create_filename}.yaml"
    File.open("cipher/#{@filename}", 'w') { |file| file.write save_to_yaml }
    display_file_location
  rescue SystemCallError => e
    puts "Error while writing to file #{@filename}."
    puts e
    # raise SystemCallError
  end

  def save_to_yaml
    YAML.dump(
      'message' => @message,
      'decoded_message' => @decoded_message
    )
  end

  def create_filename
    message.scan(/\w+/).join
  end

  def display_file_location
    puts "'#{message}' has been decoded."
    puts "The 25 possibilities are saved in a file in cipher/#{@filename}"
  end
end

# breaks the Ceaser Cipher code
class CaesarBreaker
  attr_reader :message
  attr_accessor :decoded_message
  include Database

  CODE_SHIFTS = (1..25).to_a

  def initialize(message)
    @message = message
    @decoded_message = []
    create_decode_messages
  end

  def create_decode_messages
    CODE_SHIFTS.each do |shift|
      decoded_message << translate(shift)
    end
    save_message
  end

  def translate(shift, result = '')
    message.each_char do |char|
      base = char.ord < 91 ? 65 : 97
      result << character_shift(char, base, shift)
    end
    result
  end

  def character_shift(char, base, shift)
    if char.ord.between?(65, 90) || char.ord.between?(97, 122)
      rotation = (((char.ord - base) + shift) % 26) + base
      rotation.chr
    else
      char
    end
  end
end

# phrase = CaesarBreaker.new('Ebiil, Tloia!')

# # https://relishapp.com/rspec/rspec-core/docs/helper-methods/define-helper-methods-in-a-module

RSpec.configure do |c|
  c.include Database
end

describe CaesarBreaker do
  subject(:phrase) { described_class.new('Ebiil, Tloia!') }

  # describe '#initialize' do
  #   it 'is a CaesarBreaker' do
  #     expect_any_instance_of(CaesarBreaker).to receive(:create_decode_messages)
  #     expect(phrase).to be_a(CaesarBreaker)
  #   end
  # end

  describe '#save_message' do
    # it 'responds to save_message' do
    #   allow(phrase).to receive(:display_file_location)
    #   expect(phrase).to respond_to(:save_message)
    # end

    it 'saves a file without raising an error' do
      expect_any_instance_of(CaesarBreaker).to receive(:create_decode_messages)
      expect(phrase).to receive(:create_filename)
      expect(File).to exist('/Users/rmoser/projects/odin_on_rails/ruby_rspec_TOP/spec/cipher/EbiilTloia.yaml')
      expect(phrase).to receive(:display_file_location)
      expect { phrase.save_message }.not_to raise_error
    end

    # it 'raises an error' do
    #   expect_any_instance_of(CaesarBreaker).to receive(:create_decode_messages)
    #   allow(File).to receive(:open).and_raise(Errno::ENOENT)
    #   # allow(YAML).to receive(:dump).and_raise(Errno::ENOENT)
    #   # expect { phrase.save_message }.to raise_error
    #   # expect { phrase.save_message }.to raise(Errno::ENOENT)
    #   expect { phrase.save_message }.to raise(SystemCallError
    # end
  end
end

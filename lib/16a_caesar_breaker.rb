# frozen_string_literal: false

require_relative '../lib/16b_caesar_translator'
require_relative '../lib/16c_database'

# This file can be run in the console, by uncommenting the appropriate
# commands at the bottom of this file. Be sure to commented them out before
# running rspec to avoid errors.

# breaks the Caeser Cipher code
class CaesarBreaker
  attr_reader :message, :decrypted_messages, :translator
  include Database

  CODE_SHIFTS = (1..25).to_a

  def initialize(message)
    @message = message
    @translator = CaesarTranslator.new(message)
    @decrypted_messages = []
  end

  def decrypt
    create_decrypted_messages
    save_decrypted_messages
  end

  def create_decrypted_messages
    CODE_SHIFTS.each do |shift|
      decrypted_messages << @translator.translate(shift)
    end
  end
end

# phrase = CaesarBreaker.new('Ebiil, Tloia!')
# phrase.decrypt

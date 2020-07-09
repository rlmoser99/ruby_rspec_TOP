# frozen_string_literal: false

require_relative '../lib/16_database'

# breaks the Ceaser Cipher code
class CaesarBreaker
  attr_reader :message
  attr_accessor :decrypted_messages
  include Database

  CODE_SHIFTS = (1..25).to_a

  def initialize(message)
    @message = message
    @decrypted_messages = []
  end

  def decrypt
    create_decrypted_messages
    save_decrypted_messages
  end

  def create_decrypted_messages
    CODE_SHIFTS.each do |shift|
      decrypted_messages << translate(shift)
    end
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
# phrase.decrypt

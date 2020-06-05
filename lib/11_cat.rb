# frozen_string_literal: true

require_relative '../lib/11_pet'

class Cat < Pet
  def talk
    'meow'
  end

  def likes_to_nap?
    true
  end
end

# ginger = Cat.new('ginger')
# puts ginger.talk
# puts ginger.likes_to_nap?

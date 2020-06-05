# frozen_string_literal: true

require_relative '../lib/11_pet'

# Not only will the class being tested be located in a different file,
# but there are multiple classes for this example. All files begin with '11_'

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

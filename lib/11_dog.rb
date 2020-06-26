# frozen_string_literal: true

require_relative '../lib/11_pet'

# Not only will the class being tested be located in a different file,
# but there are multiple classes for this example. All files begin with '11_'

# Dog is a sub-class of Pet
class Dog < Pet
  def talk
    'WOOF!'
  end

  def sleeping?
    true
  end

  def barking?
    false
  end
end

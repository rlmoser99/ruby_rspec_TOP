# frozen_string_literal: true

require_relative '../lib/11_pet'

# This example has a 'Pet' class with two sub-classes 'Cat' and 'Dog'.
# There is a spec file for cat & dog (each file begins with '11_').

# In addition, there is a third spec file called '11_shared_example'.
# This file has two tests that are used in both the cat & dog spec files.

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

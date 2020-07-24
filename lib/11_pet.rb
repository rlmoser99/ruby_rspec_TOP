# frozen_string_literal: true

# This example has a 'Pet' class with two sub-classes 'Cat' and 'Dog'.
# There is a spec file for cat & dog (each file begins with '11_').

# In addition, there is a third spec file called '11_shared_example'.
# This file has two tests that are used in both the cat & dog spec files.

# base class for a pet
class Pet
  attr_reader :name, :breed, :color

  def initialize(name, breed = nil, color = nil)
    @name = name
    @breed = breed
    @color = color
  end

  def meal_time
    "#{name} paws at empty food bowl"
  end
end

# frozen_string_literal: true

# This example has multiple files:
# lib/11a_pet.rb is the parent 'Pet' class of 'Cat' and 'Dog'
# lib/11b_cat.rb is a subclass 'Cat'
# lib/11c_dog.rb is a subclass 'Dog'
# spec/11a_shared_example_spec.rb has shared tests for 'Cat' and 'Dog'
# spec/11b_cat_spec.rb has tests for the subclass 'Cat'
# spec/11c_dog_spec.rb has tests for the subclass 'Dog'

# The file order to complete this exercise:
# 1. Familarize yourself with the 3 files in the lib folder.
# 2. Review the tests in spec/11a_shared_example_spec.rb
# 3. Complete either spec/11b_cat_spec.rb or spec/11c_dog_spec.rb

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

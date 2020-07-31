# frozen_string_literal: true

require_relative '../lib/11a_pet'

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

# Cat is a sub-class of Pet
class Cat < Pet
  def talk
    'meow'
  end

  def hiding?
    true
  end

  def hungry?
    false
  end
end

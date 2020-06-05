# frozen_string_literal: true

require_relative '../lib/11_pet'

class Dog < Pet
  def talk
    'WOOF!'
  end

  def likes_to_run?
    true
  end
end

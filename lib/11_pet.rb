# frozen_string_literal: true

# Not only will the class being tested be located in a different file,
# but there are multiple classes for this example. All files begin with '11_'

# base class for a pet
class Pet
  attr_accessor :name, :breed, :color

  def initialize(name, breed = nil, color = nil)
    @name = name
    @breed = breed
    @color = color
  end

  def meal_time
    "#{name} paws at empty food bowl"
  end
end

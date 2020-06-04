# frozen_string_literal: true

# Basic Drink Class
class Drink
  attr_accessor :type

  def initialize(type = 'water')
    @type = type
  end
end

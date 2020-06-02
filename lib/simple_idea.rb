# frozen_string_literal: true

# Class Idea for MovieFan
class Car
  attr_accessor :make, :model, :year
  def initialize(make, model, year = 2016)
    @make = make
    @model = model
    @year = year
  end
end

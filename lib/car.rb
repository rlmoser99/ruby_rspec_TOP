# frozen_string_literal: true

# Basic Car Class
class Car
  attr_accessor :make, :model, :year
  def initialize(make, model, year)
    @make = make
    @model = model
    @year = year
  end
end

# frozen_string_literal: true

# Movies need stuff
class Movie
  attr_accessor :title, :character_list

  def initialize(title)
    @title = title
    @character_list = []
  end

  def add_character(name)
    name = Character.new(name)
    character_list << name
  end
end

# Characters are needed in a movie
class Character
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class PrincessBride
  attr_accessor :characters, :props
  def initialize
    @characters = ['Vizzini', 'Fezzik', 'Inigo Montoya']
    @props = {
      12 => 'rodents of unusual size',
      2 => 'goblets',
      1 => 'bottle of Iocane powder'
    }
  end
end

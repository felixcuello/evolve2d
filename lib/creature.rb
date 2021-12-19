# frozen_string_literal: true

# This class represent one of the creatures that live in the world
class Creature
  attr_reader :age, # Age is measured in the amount of updates
              :row,
              :col,
              :color

  def initialize(world:, row:, col:, color: 'red')
    @world = world
    @row = row
    @col = col
    @color = color

    @age = 0
  end

  # Updates the creature
  def update!
    @age += 1

    self
  end
end

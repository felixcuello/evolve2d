# frozen_string_literal: true

# This class represent one of the creatures that live in the world
class Creature
  attr_reader :age, # Age is measured in the amount of updates
              :row,
              :col

  def initialize(world:, row:, col:, color: 'random')
    @age = 0
    @color = color
    @world = world
    @row = row
    @col = col
  end

  # Updates the creature
  def update!
    @age += 1

    self
  end
end

# frozen_string_literal: true

# This class represent one of the creatures that live in the world
class Creature
  attr_reader :age       # Age is measured in the amount of updates

  def initialize(color: 'random')
    @age = 0
    @color = color
  end

  # Updates the creature
  def update!(world:)
    @age += 1

    self
  end
end

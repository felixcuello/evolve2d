# frozen_string_literal: true

# This class represent one of the creatures that live in the world
class Brick
  attr_reader :row, :col, :color

  def initialize(world, row, col, color = 'gray')
    @world = world
    @row = row
    @col = col
    @color = color
  end

  def update!
    self
  end
end

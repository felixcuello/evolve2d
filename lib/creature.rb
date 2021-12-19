# frozen_string_literal: true

# This class represent one of the creatures that live in the world
class Creature
  attr_reader :age, # Age is measured in the amount of updates
              :row,
              :col,
              :color

  AVAILABLE_COLORS = ['red', 'blue', 'green', 'yellow', 'black']

  def initialize(row:, col:, color: nil)
    @row = row
    @col = col
    @color = AVAILABLE_COLORS.sample if color.nil?

    @age = 0
  end

  # Moves the object to a different location
  def move!(new_row, new_col)
    @old_row = @row
    @old_col = @col

    @row = new_row
    @col = new_col
  end

  # Rollbacks the move
  def rollback_move!
    @row = @old_row
    @col = @old_col
  end

  # Updates the creature
  def update!
    @age += 1

    self
  end
end

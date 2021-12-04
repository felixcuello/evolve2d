# lib/world.rb

require 'ruby2d'

AMOEBA_SIZE = 10
MAX_SPEED = 5
NUMBER_OF_AMOEBAS = 50

class Amoeba
  attr_reader :square

  def initialize
    @size = AMOEBA_SIZE
    @genes = [(-MAX_SPEED..MAX_SPEED).to_a.sample, (-MAX_SPEED..MAX_SPEED).to_a.sample]
    @x = rand(1.8*Window.width)
    @y = rand(1.8*Window.height)
    @x_speed = @genes[0]
    @y_speed = @genes[1]
    @color = Color.new('random')
    @square = nil
  end

  def draw
    @square = Square.new(x: @x, y: @y, size: @size, color: @color)
  end

  def move
    return if reached_x_window_limits?
    return if reached_y_window_limits?

    up_blocked    = false
    down_blocked  = false
    left_blocked  = false
    right_blocked = false

    ($amoebas - Array(self)).any? do |other|
      next unless @square
      next unless other.square

      right_blocked |= @square.contains?(other.square.x2, other.square.y2) || @square.contains?(other.square.x3, other.square.y3)
      left_blocked  |= @square.contains?(other.square.x1, other.square.y1) || @square.contains?(other.square.x4, other.square.y4)
      up_blocked    |= @square.contains?(other.square.x1, other.square.y1) || @square.contains?(other.square.x2, other.square.y2)
      down_blocked  |= @square.contains?(other.square.x3, other.square.y3) || @square.contains?(other.square.x4, other.square.y4)
    end

    @x += @x_speed if @x_speed > 0 && !right_blocked
    @x += @x_speed if @x_speed < 0 && !left_blocked
    @y += @y_speed if @y_speed > 0 && !down_blocked
    @y += @y_speed if @y_speed < 0 && !up_blocked
  end

  def reached_x_window_limits?
    return true if @x <= 0                     # left wall
    return true if @x >= Window.width - @size  # right wall

    false
  end

  def reached_y_window_limits?
    return true if @y <= 0                      # top wall
    return true if @y >= Window.height - @size  # bottom wall

    false
  end
end

$amoebas = Array.new(NUMBER_OF_AMOEBAS) { Amoeba.new }

#  This is how the world works
class World
  VERSION = '0.0.1'.freeze

  attr_accessor :amoebas

  def initialize
  end

  def update!
    $amoebas.each do |amoeba|
      amoeba.draw
      amoeba.move
    end
  end
end

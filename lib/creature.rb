require 'brain'
require 'basic_object'

#  This is creature :-)
#    It has a very small brain, with some output neurons that can be used
#    to create behavior to the creature
class Creature < BasicObject
  OUTPUT_NEURONS = 2

  def initialize(world:)
    super

    @brain = ::Brain.new(output_neurons: OUTPUT_NEURONS)

    r = ::Random.rand(256)
    g = ::Random.rand(256)
    b = ::Random.rand(256)

    @world = world
    @color = ::Kernel.sprintf('#%02x%02x%02x', r, g, b)
  end

  def color
    @color
  end

  def update!
    @a ||= ::Random.rand(OUTPUT_NEURONS)
    @b ||= ::Random.rand(OUTPUT_NEURONS)

    @row_update = @brain.think(@a)
    @col_update = @brain.think(@b)

    return unless @world.move!(self, @row, @col, @row + @row_update, @col + @col_update)

    @col += @col_update
    @row += @row_update
  end
end

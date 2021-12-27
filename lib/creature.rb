require 'brain'
require 'basic_object'

#  This is creature :-)
#    It has a very small brain, with some output neurons that can be used
#    to create behavior to the creature
class Creature < BasicObject
  def initialize(world:, movement_neuron_connections: nil, color: nil)
    super

    @movement_neuron_connections = if movement_neuron_connections.nil?
                                     generate_movement_neuron_connections
                                   else
                                     movement_neuron_connections
                                   end

    @brain = ::Brain.new(world: world,
                         movement_connections: @movement_neuron_connections)

    if color.nil?
      r = ::Random.rand(256)
      g = ::Random.rand(256)
      b = ::Random.rand(256)

      @color = ::Kernel.sprintf('#%02x%02x%02x', r, g, b)
    else
      @color = color
    end

    @world = world
  end

  def generate_movement_neuron_connections
    result = []
    ::Brain.number_of_movement_neurons.times { result << ::Random.rand(2).zero? }
    result
  end

  def color
    @color
  end

  def update!
    @row_update, @col_update = @brain.move

    # ::Kernel.puts "a=#{@row_update} / b=#{@col_update}"

    return unless @world.move!(self, @row, @col, @row + @row_update, @col + @col_update)

    @col += @col_update
    @row += @row_update
  end

  def to_s
    "#{@movement_neuron_connections.map { |n| n ? 1 : 0 }.join(' ')},#{@color}"
  end
end

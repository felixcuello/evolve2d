require 'neuron/movement'

class Brain
  MOVEMENT_NEURONS = [
    ::Neuron::Movement.up,
    ::Neuron::Movement.down,
    ::Neuron::Movement.left,
    ::Neuron::Movement.right,
    ::Neuron::Movement.up_left,
    ::Neuron::Movement.up_right,
    ::Neuron::Movement.down_left,
    ::Neuron::Movement.down_right,
    ::Neuron::Movement.still,
    ::Neuron::Movement.random,
    ::Neuron::Movement.random_jump,
  ]

  def initialize(world:, movement_connections: Array.new(number_of_movement_neurons, false))
    @movement_connections = movement_connections
    @world = world
  end

  def self.number_of_movement_neurons
    MOVEMENT_NEURONS.count
  end

  def move
    if !defined?(@movement_neurons)
      @movement_neurons = []

      MOVEMENT_NEURONS.each_with_index do |mn, i|
        @movement_neurons << mn if @movement_connections[i]
      end
    end

    result = [0, 0]
    @movement_neurons.each do |movement_neuron|
      result[0], result[1] = movement_neuron.call(result)
    end
    result
  end
end

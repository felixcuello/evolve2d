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
    ::Neuron::Movement.random,
    ::Neuron::Movement.random_jump,
  ]

  def initialize(movement_connections: Array.new(number_of_movement_neurons, false))
    @movement_connections = movement_connections
  end

  def self.number_of_movement_neurons
    MOVEMENT_NEURONS.count
  end

  def move
    if !defined?(@genes)
      @genes = []
      MOVEMENT_NEURONS.each_with_index do |mn, i|
        @genes << mn if @movement_connections[i]
      end
    end

    result = [0, 0]
    @genes.each do |gene|
      result[0], result[1] = gene.call(result)
    end
    result
  end
end

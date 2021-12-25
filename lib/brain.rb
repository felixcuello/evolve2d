require 'neuron/cycler'
require 'neuron/minus_one'
require 'neuron/one'
require 'neuron/random_trinary'
require 'neuron/zero'

class Brain
  LAYER_0 = 0
  LAYER_1 = 1
  LAYER_2 = 2

  def initialize(output_neurons:, genes: '')
    @neurons = [[], [], []]

    @neurons[LAYER_0] << ::Neuron.cycler           # Cycles
    @neurons[LAYER_0] << ::Neuron.zero             # Emits always 0
    @neurons[LAYER_0] << ::Neuron.one              # Emits always 1
    @neurons[LAYER_0] << ::Neuron.minus_one        # Emits always -1
    @neurons[LAYER_0] << ::Neuron.random_trinary   # Emits a random [-1, 0, 1]

    @memo_neuron = {}
    @output_neurons = output_neurons
    @output_neurons.times do |n_neuron|
      composition = []
      @neurons[LAYER_0].each do |e|
        composition << e if ::Random.rand(2).zero? # Acá elegimos las neuronas de input que van a estar presentes
      end

      ##  ESTO es el seleccionador de neuronas
      ##  debería hacer una suerte de composición de funciones, en lugar de elegir una de las que se eligieron arriba
      ##  pero eso es para la siguiente iteración
      @neurons[LAYER_2] << lambda do
        @memo_neuron[n_neuron] ||= ::Random.rand(@neurons[LAYER_0].count)
        @neurons[LAYER_0][@memo_neuron[n_neuron]].call
      end
    end
  end

  def number_of_generators
    @neurons[LAYER_0].count
  end

  def think(output_neuron)
    @neurons[LAYER_2][output_neuron].call
  end
end

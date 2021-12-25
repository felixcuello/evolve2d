module Neuron
  def self.random_trinary
    lambda do
      sign = ::Random.rand(2).zero? ? -1 : 1
      number = ::Random.rand(2)

      sign * number
    end
  end
end

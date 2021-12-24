require 'basic_object'

class Creature < BasicObject
  def initialize(world:)
    super

    r = ::Random.rand(256)
    g = ::Random.rand(256)
    b = ::Random.rand(256)

    @color = ::Kernel.sprintf('#%02x%02x%02x', r, g, b)
  end

  def color
    @color
  end

  def update!
    @col += (::Random.rand(2) == 0 ? 1 : -1) * ::Random.rand(2)
    @row += (::Random.rand(2) == 0 ? 1 : -1) * ::Random.rand(2)
  end
end

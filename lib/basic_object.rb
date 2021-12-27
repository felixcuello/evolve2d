class BasicObject
  attr_reader :row, :col

  def initialize(world:, movement_neuron_connections:, color:)
    @world = world
    @row = row
    @col = col
  end

  def color
    '#808080' # Gray
  end

  def place(row, col)
    @row = row
    @col = col
  end

  def update!
    # Do nothing
  end

  def to_s
    ''
  end
end

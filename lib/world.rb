require 'ruby2d'

#  This is the class that controls the world for the creatures
# --------------------------------------------------------------------------
class World
  attr_reader :rows, :cols, :object_size

  #  Creates the world
  # -----------------------------------------------
  def initialize(rows:, cols:, object_size: 10)
    @grid = []
    @spins = 0
    @rows = rows
    @cols = cols

    rows.times do
      @grid << Array.new(cols, 0)
    end

    @object_size = object_size
  end

  #  Randomize places for the objects
  # -----------------------------------------------
  def randomize!(objects: [])
    @objects = objects

    @objects.each do |object|
      row = rand(rows)
      col = rand(cols)

      until empty?(row, col)
        row = rand(rows)
        col = rand(cols)
      end

      # FIXME: This is just for testing purposes
      # row = rows / 2
      # col = cols / 2
      # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

      object.place(row, col)
      @grid[object.row][object.col] = object
    end
  end

  #  Spins the world (infinite loop)
  # -----------------------------------------------
  def spin!(spin_delay:)
    Ruby2D::Window.set(background: 'white',
                       width: cols * object_size,
                       height: rows * object_size)

    Ruby2D::Window.update do
      @spins += 1
      puts "World Spinning!! [Spin ##{@spins}]"

      Ruby2D::Window.clear

      @objects.each do |object|
        Square.new(x: object.col.to_i * object_size,
                   y: object.row.to_i * object_size,
                   size: object_size,
                   color: object.color)

        object.update!
      end

      sleep spin_delay
    end

    Ruby2D::Window.show
  end

  #  Test if the row,col is empty
  # -----------------------------------------------
  def empty?(row, col)
    @grid[row][col] == 0
  end

  #  Places an object in a given row,col
  # -----------------------------------------------
  def place(object, row, col)
    return false unless empty?(row, col)

    @grid[row][col] = object

    true
  end

  #  Moves an object from one place to the other
  # -----------------------------------------------
  def move!(object, from_row, from_col, to_row, to_col)
    return false if invalid_position?(to_row, to_col)
    return false unless empty?(to_row, to_col)

    @grid[from_row][from_col] = 0
    @grid[to_row][to_col] = object
  end

  #  Returns true if the desired row, col is invalid
  # -----------------------------------------------
  def invalid_position?(row, col)
    return true if row < 0
    return true if row >= rows
    return true if col < 0
    return true if col >= cols

    false
  end
end

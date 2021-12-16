# lib/world.rb

class World
  attr_reader :rows, :cols, :cell

  # initializes the world
  #   - rows: the amount of rows of this world
  #   - cols: the amount of cols of this world
  def initialize(rows, cols)
    @rows = rows
    @cols = cols

    @cell = []
    cols.times { @cell << [] }
  end

  # given: a position (row, col)
  # returns:
  #   - true:  if the position is empty
  #   - false: otherwise
  def empty?(row, col)
    @cell[row][col].nil?
  end

  # given: a position (row, col)
  # returns:
  #   - false: if the position is occuppied
  #   - true: otherwise
  def occuppied?(row, col)
    !empty?(row, col)
  end

  # given: a position(row,col) and an object
  # returns:
  #   - true: if the object could be added
  #   - false: otherwise
  def add(row, col, object)
    return false if occuppied?(row, col)

    @cell[row][col] = object
    true
  end

  # given: a position(row, col)
  # returns:
  #   - the object stored in that position (or nil)
  def get(row, col)
    @cell[row][col]
  end

  # given: an origination position(orig_row, orig_col) and a destination position (dest_row, dest_col)
  # returns:
  #   - true: if the object could be moved
  #   - false: otherwise
  def move(orig_row, orig_col, dest_row, dest_col)
    return false if occuppied?(dest_row, dest_col)

    @cell[dest_row][dest_col] = @cell[orig_row][orig_col]
    @cell[orig_row][orig_col] = nil

    true
  end
end

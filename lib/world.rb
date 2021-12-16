# lib/world.rb

class World
  attr_reader :rows, :cols, :cell_size

  # initializes the world
  #   - rows: the amount of rows of this world
  #   - cols: the amount of cols of this world
  def initialize(rows:, cols:, cell_size: 10)
    @rows = rows
    @cols = cols
    @cell_size = cell_size

    @cell = {}
  end

  # given: a position (row, col)
  # returns:
  #   - true:  if the position is empty
  #   - false: otherwise
  def empty?(row, col)
    @cell[cell_key(row, col)].nil?
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
  def set!(row, col, object)
    return false if out_of_boundaries?(row, col)
    return false if occuppied?(row, col)

    @cell[cell_key(row, col)] = object
    true
  end

  # given: a position(row, col)
  # returns:
  #   - the object stored in that position (or nil)
  def get(row, col)
    @cell[cell_key(row, col)]
  end

  # given: a position(row, col)
  # returns:
  #   - it deletes the object at that position (no questions asked)
  def delete!(row, col)
    @cell.delete(cell_key(row, col))
  end

  # given: an origination position(orig_row, orig_col) and a destination position (dest_row, dest_col)
  # returns:
  #   - true: if the object could be moved
  #   - false: otherwise
  def move(orig_row, orig_col, dest_row, dest_col)
    object = get(orig_row, orig_col)

    return false unless set!(dest_row, dest_col, object)

    delete!(orig_row, orig_col)

    true
  end

  private

  # given: a position(row, col)
  # returns: the key to be used
  def cell_key(row, col)
    [row, col]
  end

  # given: a position(row, col)
  # returns:
  #   - true: if it's out of the world boundaries
  #   - false: otherwise
  def out_of_boundaries?(row, col)
    return true if row.negative?
    return true if row >= rows
    return true if col.negative?
    return true if col >= cols

    false
  end
end
